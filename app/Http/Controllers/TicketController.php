<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Mail;
use App\Models\Ticket;
use App\Models\Mensaje;
use App\Mail\SendTicket;
use App\Models\Categoria;
use App\Models\Categorias_has_ticket;
use App\Models\User;
use App\Models\Estatu;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Mpdf;
use DB;
use Spatie\Activitylog\Models\Activity;
class TicketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $heads = $this->head_datatables();
        $categorias = Categoria::all();
        return view('tickets.index',[
            'columns'=> $heads['columns'],
            'head'=>$heads['head'],
            'categorias'=>$categorias
        ]);
    }
    public function head_datatables(){
        $columns = array(
            array('data'=>'id'),
            array('data'=>'codigo'),
            array('data'=>'titulo'),
            array('data'=>'apertura'),
            array('data'=>'categorias'),
            array('data'=>'status_info'),
            array('data'=>'fecha_caducidad'),
            array('data'=>'created_at'),
            array('data'=>'action'),
        );
        $head = array(
            'ID',
            'Codigo',
            'Titulo',
            'Apertura',
            'Categorias',
            'Estatus',
            'Fecha de caducidad',
            'Fecha de creacion',
            'Action',
        );
        return array('columns'=>$columns,'head'=>$head);
    }
    public function query_messages($id){
        $userId = auth()->id();
        $query = Mensaje::select(
            'id',
        DB::raw("IF(`from_id` =$userId,TRUE,FALSE) as escribe_active"),
        'from_id',
        'mensaje',
        'img_src',
        'file_src',
        'notice_message',
        'created_at')->where('ticket_id',$id)->get();
        $query->map(function($q){
            $user_from = User::find($q->from_id);
            $q->from_user = (!empty($user_from)) ? $user_from : '';
        });
        return $query;
    }
    public function export_pdf($id){
        $ticket = Ticket::find($id);
        $mensajes = $this->query_messages($id);
        $user = User::find($ticket->users_id);
        /*Ajustamos las  medidas, orientacio y formato  de las paginas*/
        $mpdf = new \Mpdf\Mpdf([
            'margin_left' => 6,
            'margin_right' => 6,
            'margin_top' => 35,
            'margin_bottom' => 10,
            'margin_header' => 5,
            'margin_footer' => 5,
            'mode' => 'utf-8', 
            'format' => 'A4',
            'orientation' => 'P'
        ]);
        $mpdf->SetProtection(array('print'));
        $mpdf->SetTitle("Ticket resolved");
        $mpdf->SetAuthor("Acme Trading Co.");
        $mpdf->SetWatermarkText("");   // anulada
        $mpdf->showWatermarkText = true;
        $mpdf->watermark_font = 'DejaVuSansCondensed';
        $mpdf->watermarkTextAlpha = 0.1;
        $mpdf->SetDisplayMode('fullpage');
        $mpdf->WriteHTML(view('export_pdf.ticket',['ticket'=>$ticket,'mensajes'=>$mensajes,'user'=>$user]));
        $mpdf->Output('resolvedticket'.$id.'.pdf', 'I');
    }
    public function filter_datatable(Request $request){
        $tipe = $request->get('tipe');
        if ($tipe == 'all') {
            return $this->datatables(Ticket::all());
        }else if ($tipe == 'filter_category') {
            $id =  $request->get('id_filter');
            $ticket = ticket::whereHas('categorias', function ($query) use ($id) {
                return $query->where('categoria_id', '=', $id);
            })->get();
            return $this->datatables($ticket);
        }

    }
    public function datatables($ticket){
        $table = Datatables::of($ticket);
        $estatus = Estatu::all();
        $table->addColumn('action', function($row){
            $url = url('tickets').'/'.$row['id'];
            return view('layouts.buttons_datatables',['id'=>$row['id'],'url'=>$url,'ticket'=>'1']);
        })->editColumn('categorias', function($row){
            if (count($row['categorias']) > 0) {
                $message = '';
                foreach ($row['categorias'] as $c) {
                    $message .= view('layouts.categoria_datable',['nombre'=>$c->nombre]);
                }
                return $message;
            }
        })->addColumn('status_info', function($row) use ($estatus){
            $url_status = url('status/ticket');
            return view('layouts.status',['status'=>$row['status'],'id_ticket'=>$row['id'],'url_action'=>$url_status,'estatus'=>$estatus]);
        })->editColumn('fecha_caducidad', function($row){
            Carbon::setLocale('es');
            $ticket = ticket::find($row['id']);

            $fechaExpiracion = Carbon::parse($ticket->fecha_caducidad);

            $diasDiferencia = $fechaExpiracion->diffForHumans();
            //echo $diasDiferencia;
            $fechaSistema   = new \DateTime();
            $diaEntrega     = new \DateTime( $ticket->fecha_caducidad );// setear tus fechas aqui

            $interval_now    = $fechaSistema->diff($diaEntrega);
            $dias_restantes = $interval_now->format('%R%a');
            if ($dias_restantes <  0) {
                return 'Caducado';
            }
            return $diasDiferencia;
        })->rawColumns(['action','categorias']);
        return $table->make(true);
    }
    public function change_status(Request $request){
        $all = $request->all();
        $ticket = Ticket::find($all['id_ticket']);
        $estatus = Estatu::find($all['id_status']);
        $ticket->status = $estatus->nombre;
        $ticket->save();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
       
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $all =  $request->all();
        $ticket = new Ticket();
        $validator = Validator::make($all,[
            'titulo' => 'required',
            'user'   => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else{
            $user = User::where('email',$all['user'])->first();
            if (!empty($user)) {
                $all['users_id'] = $user->id;
                $all['apertura'] = Auth()->user()->name;
                $all['codigo'] = $this->generate_cod_venta();
                $all['status'] = 'active';
                $ticket->fill($all)->save();
                $id_last = Ticket::orderBy('id','DESC')->first();
                for ($i=0; $i <count($all['categorias']) ; $i++) { 
                    $categorias = new Categorias_has_ticket();
                    $categorias->categoria_id = $all['categorias'][$i];
                    $categorias->ticket_id = $id_last->id;
                    $categorias->save();
                }
            }else{
                return response()->json(['error'=>array('El usuario no existe')],422);
            }

            $mail = Mail::to($user->email)->send(new SendTicket($all));
            $all['apertura_email'] = true;
            $mail = Mail::to(Auth()->user()->email)->send(new SendTicket($all));
            return response()->json(['success'=>'Ticket creado con exito','reload'=>1]);
        }
    }
    public function generate_cod_venta(){
        $mensaje  = Ticket::orderBy('id','DESC')->first();
        $codigo = sprintf("%08d",1);
        if (!empty($mensaje)) {
            $exp = explode('-', $mensaje->codigo);
            $codigo_result = sprintf("%00d", $exp[1]);
            $codigo = $codigo_result+1;
            $codigo = sprintf("%08d", $codigo);

        }
        return 'TK-'.$codigo;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {   
        $ticket = Ticket::with('users')->find($id);

        $mensaje_count = Mensaje::where('ticket_id',$id)->count();
        return view('tickets.view',['id'=>$id,'ticket'=>$ticket,'mensaje_count'=>$mensaje_count]);
    }
    public function filter_category($id)
    {  
        $heads = $this->head_datatables();
        $categorias = Categoria::all();
        return view('tickets.filter_category',[
            'columns'=> $heads['columns'],
            'head'=>$heads['head'],
            'categorias'=>$categorias,
            'id_filter'=>$id
        ]);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return Ticket::with('users','categorias')->find($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $all =  $request->all();
        $ticket = Ticket::find($id);
        $validator = Validator::make($all,[
            'titulo' => 'required',
            'categorias' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else{
            if (!empty($all['user'])) {
                $user = User::where('email',$all['user'])->orWhere('name',$all['user'])->first();
    
                if (empty($user)) {
                    return response()->json(['error'=>array('El usuario no existe')],422); 
                }
                $all['users_id'] = $user->id;
            }

            $campos = '';
            $id_ticket = $ticket->id;
            $ticket->fill($all)->save();
            if ($request->input('check_categories_log') == 1) {
                $campos.='<b> Categorias </b> | ';
                $categorias = Categorias_has_ticket::where('ticket_id',$id)->delete();
                for ($i=0; $i <count($all['categorias']) ; $i++) { 
                    $categorias = new Categorias_has_ticket();
                    $categorias->categoria_id = $all['categorias'][$i];
                    $categorias->ticket_id = $id;
                    $categorias->save();
                }
            }
            $activity = Activity::where('subject_id',$id_ticket)->orderBy('created_at','DESC')->first();

            $atributos = array(  
                array('name' => 'titulo' , 'title'=>'Titulo'),
                array('name' => 'descripcion' , 'title'=>'Descripcion'),
                array('name' => 'apertura' , 'title'=>'Apertura'),
                array('name' => 'fecha_caducidad' , 'title'=>'Fecha de caducidad'),
                array('name' => 'status' , 'title'=>'Estatus del ticket'),
                array('name' => 'users_id' , 'title'=>'Usuario asignado')
            );
            if (!empty($activity)) {
                if ($activity->created_at->timestamp == time()) {       
                    foreach ($atributos as $k) {
                        $name_attr =  $k['name'];
                        if (isset($activity->changes['attributes'][$name_attr])) {
                            $campos .= '<b>'.$k['title'].'</b> |';
                        }
                    }
                }
            }
            if (!empty($campos)) {
                $info_message = Mensaje::create([
                    'from_id' => auth()->id(),
                    'mensaje' => 'Se ha actualizado el ticket, actualizacion: '.$campos,
                    'ticket_id' => $id_ticket,
                    'notice_message' => 1,
                ]);
            }

            
            return response()->json(['success'=>'Ticket actualizado con exito','reload'=>1]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $ticket = Ticket::find($id);
        if (!empty($ticket)) {
            Categorias_has_ticket::where('ticket_id',$id)->delete();
            Mensaje::where('ticket_id',$id)->delete();
            $ticket->delete();
            return response()->json(['success'=>'Registro eliminado con exito','reload'=>1]);
        }
    }
}
