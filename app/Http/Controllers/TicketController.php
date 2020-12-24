<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Ticket;
use App\Models\Mensaje;
use App\Models\Categoria;
use App\Models\Categorias_has_ticket;
use App\Models\User;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Mpdf;
use DB;
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
        })->addColumn('status_info', function($row){
            $url_status = url('status/ticket/'.$row['id']);
            return view('layouts.status',['status'=>$row['status'],'id_ticket'=>$row['id'],'url_action'=>$url_status]);
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
    public function change_status($id){
        $ticket = Ticket::find($id);

        if ($ticket->status == 'active') {
            $ticket->status = 'inactive';
        }else{
            $ticket->status = 'active';
        }
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
    {   $ticket = Ticket::find($id);
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
        $categorias = Categoria::all();
        return view('tickets.edit',[
            'ticket'=>Ticket::with('categorias')->find($id),
            'categorias'=>$categorias
        ]);  
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
            $info_message = Mensaje::create([
                'from_id' => auth()->id(),
                'mensaje' => 'Se ha actualizado la cabecera del archivo',
                'ticket_id' => $ticket->id,
                'notice_message' => 1,
            ]);
            $ticket->fill($all)->save();
            $categorias = Categorias_has_ticket::where('ticket_id',$id)->delete();
            for ($i=0; $i <count($all['categorias']) ; $i++) { 
                $categorias = new Categorias_has_ticket();
                $categorias->categoria_id = $all['categorias'][$i];
                $categorias->ticket_id = $id;
                $categorias->save();
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
