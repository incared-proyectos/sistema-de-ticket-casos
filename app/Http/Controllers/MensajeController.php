<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use App\Models\Mensaje;
use App\Models\User;
use App\Models\Ticket;
use App\Models\Cron_job_mail;
use DB;

class MensajeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $all = $request->all();
        $validator = Validator::make($all,[
            'mensaje' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else{

            $mensaje = new Mensaje();
            if(!Storage::disk('public_uploads')->has('ticket')){
                Storage::disk('public_uploads')->makeDirectory('ticket');
                if (!Storage::disk('public_uploads')->has('ticket/'.$all['ticket_id'])) {
                    Storage::disk('public_uploads')->makeDirectory('ticket/'.$all['ticket_id']);
                }
            }
            $ticket = Ticket::find($all['ticket_id']);
            if ($request->hasFile('file_archive')) {
                
                $exists = Storage::disk('public_uploads')->exists('ticket/'.$ticket->id.'/'.$ticket->file_src);
                if ($exists) {
                    Storage::disk('public_uploads')->delete('ticket/'.$ticket->id.'/'.$ticket->file_src);
                }

                $files = $request->file('file_archive');

                $name = $files->store('ticket/'.$ticket->id,['disk' => 'public_uploads']);
                $nom_img = explode('/',$name);
                $all['file_src'] = $nom_img[2];
            }
            if ($request->hasFile('file_image')) {
      
                $exists = Storage::disk('public_uploads')->exists('ticket/'.$ticket->id.'/'.$ticket->file_src);
                if ($exists) {
                    Storage::disk('public_uploads')->delete('ticket/'.$ticket->id.'/'.$ticket->file_src);
                }

                $files = $request->file('file_image');
                $extension = $files->getClientOriginalExtension();
                $allowedfileExtension=['jpg','png','jpeg','gif'];
                $check=in_array($extension,$allowedfileExtension);
                if ($check) {
                    $name = $files->store('ticket/'.$ticket->id,['disk' => 'public_uploads']);
                    $nom_img = explode('/',$name);
                    $all['img_src'] = $nom_img[2];
                }
            }
            $all['from_id'] = auth()->id();

            $json_users = json_decode($ticket->users_asigne_json);
            foreach ($json_users as $us) {
                $cron = new Cron_job_mail();
                $cron->mensaje = $all['mensaje'];
                $cron->ticket_codigo = $ticket->codigo;
                $cron->from_email = auth()->user()->email;
                $cron->from_name = auth()->user()->name;
                $cron->to_email = $us->email;
                $cron->to_name = $us->name;
                $cron->save();
            }
            if($mensaje->fill($all)->save()){
                return $this->query_message($all['ticket_id']);
            }
        }
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
    public function query_message($id){
        $userId = auth()->id();
        $query = Mensaje::select(
            'id',
        DB::raw("IF(`from_id` =$userId,TRUE,FALSE) as escribe_active"),
        'from_id',
        'mensaje',
        'img_src',
        'file_src',
        'notice_message',
        'created_at')->where('ticket_id',$id)->orderBy('created_at','DESC')->first();
        $user = User::find($query->from_id);
        $query->from_user =  (!empty($user)) ? $user : '' ;
        return $query;
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return $this->query_messages($id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
