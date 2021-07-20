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
use App\Models\Cron_job_mail;
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
        $user = User::with('categorias')->find(auth()->id());
      
        return view('tickets.index',[
            'columns'=> $heads['columns'],
            'head'=>$heads['head'],
            'categorias'=>$categorias,
            'status'=>Estatu::all(),
            'cat_user'=>$user->categorias
        ]);
    }
    public function head_datatables(){
        $columns = array(
            array('data'=>'id'),
            array('data'=>'codigo'),
            array('data'=>'titulo'),
            array('data'=>'apertura'),
            array('data'=>'categorias'),
            array('data'=>'users_ticket'),
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
            'Asignados',
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
            $ticket =  Ticket::where('apertura_id',auth()->id())->orWhere(DB::raw('JSON_EXTRACT(`users_asigne_json`, "$[0].id")'),auth()->id())->get();
         
            return $this->datatables($ticket);
        }else if ($tipe == 'filter_category') {
            $id =  $request->get('id_filter');
        
            $ticket = Ticket::whereHas('categorias', function ($query) use ($id) {
                return $query->where('categoria_id', '=', $id);
            })->where(function ($query) {
                $query->where('apertura_id', auth()->id())
                ->orWhere(DB::raw('JSON_EXTRACT(`users_asigne_json`, "$[0].id")'),auth()->id());
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
        })->addColumn('users_ticket', function($row) use ($estatus){
            return view('layouts.user_tickets',['ticket'=>$row ]);
        })->editColumn('created_at', function($row){
            setlocale(LC_TIME, 'es_ES');
            Carbon::setLocale('es');            
            $fecha = $row['created_at'];

            return '<small>'.$fecha->format('l j F Y H:i:s').'</small>';
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
        })->rawColumns(['action','categorias','status_info','created_at']);
        return $table->make(true);
    }
    public function change_status(Request $request){
        $all = $request->all();
        $ticket = Ticket::find($all['id_ticket']);
        $estatus = Estatu::find($all['id_status']);
        $ticket->status = $estatus->nombre;
        $ticket->status_color = $estatus->color;
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
            'users_asigne_json'   => 'required',
            'descripcion',
            'categorias',

        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else{
            $all['users_id'] = 1;
            $all['apertura'] = Auth()->user()->name;
            $all['apertura_id'] = auth()->id();
            $all['codigo'] = $this->generate_cod_venta();
            $all['status'] = 'Activo';
            $all['status_color'] = '#c1ffff';
            $ticket->fill($all)->save();
            $ticket_last = Ticket::orderBy('id','DESC')->first();
            for ($i=0; $i <count($all['categorias']) ; $i++) { 
                $categorias = new Categorias_has_ticket();
                $categorias->categoria_id = $all['categorias'][$i];
                $categorias->ticket_id = $ticket_last->id;
                $categorias->save();
            }
            
            

            $all['apertura_email'] = true;
            
            //Agregamos un nuevo trabajo para enviar el correo de apertura de ticket
            $cron = new Cron_job_mail();

            $cron->titulo = $all['titulo'];
            $cron->mensaje = $all['descripcion'];
            $cron->ticket_codigo = $ticket_last->codigo;
            $cron->from_email = auth()->user()->email;
            $cron->from_name = auth()->user()->name;
            $cron->to_json = $all['users_asigne_json'];
            $cron->type_email = 1;
            $cron->save();
            
            return response()->json(['success'=>'Ticket creado con exito','reload'=>1]);


        }
    }
    public function save_ticket_view(Request $request){
        $all = $request->all();
        $ticket = Ticket::find($all['id_ticket']);
        if (!empty($ticket)) {
            $ticket->users_asigne_json = $all['users_js'];
            $ticket->save();
        }
            
        
        return response()->json(['success'=>'Ticket actualizado con exito','reload'=>1]);
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
        $ticket = Ticket::with('users')
        ->where('id',$id)
        ->where(function ($query) {
            $query->where('apertura_id', auth()->id())->orWhere(DB::raw('JSON_EXTRACT(`users_asigne_json`, "$[0].id")'),auth()->id());
        })->find($id);
        if (!empty($ticket)) {
            # code...
            $user = User::find(auth()->id());
            $mensaje_count = Mensaje::where('ticket_id',$id)->count();
            return view('tickets.view',['id'=>$id,'ticket'=>$ticket,'mensaje_count'=>$mensaje_count,'status'=>Estatu::all(),'rol_user'=>$user->getRoleNames()[0]]);
        }else{
            abort(403, 'Unauthorized action.');
        }

    }
    public function filter_category($id)
    {  
        $heads = $this->head_datatables();
        $user = User::with('categorias')->find(auth()->id());
        $categorias = Categoria::all();
        return view('tickets.filter_category',[
            'columns'=> $heads['columns'],
            'head'=>$heads['head'],
            'categorias'=>$categorias,
            'status'=>Estatu::all(),
            'id_filter'=>$id,
            'cat_user'=>$user->categorias

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
    public function delete_user_asigne(Request $request){
        $all = $request->all();
        $find = ticket::find($all['ticket_id']);
        if (!empty($find)) {
            $users_asigne = json_decode($find->users_asigne_json,true);
            foreach ($users_asigne as $k => $v) {
                if ($v['email'] == $all['email']) {
                    unset($users_asigne[$k]); 
                }
            }
            $find->users_asigne_json = $all['json_users'];
            $find->save();
        }
       // return response()->json(['success'=>'Registro eliminado con exito','reload'=>1]);

    }
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
