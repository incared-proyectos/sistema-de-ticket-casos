<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Ticket;
use App\Models\User;
use Yajra\Datatables\Datatables;

class TicketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $columns = array(
            array('data'=>'id'),
            array('data'=>'codigo'),
            array('data'=>'titulo'),
            array('data'=>'apertura'),
            array('data'=>'action'),
        );
        $head = array(
            'ID',
            'Codigo',
            'Titulo',
            'Apertura',
            'Action',
        );
        return view('tickets.index',[
            'columns'=>$columns,
            'head'=>$head
        ]);
    }

    public function datatables(){
        $table = Datatables::of(Ticket::all());
        $table->addColumn('action', function($row){
            $url = url('tickets');
            return view('layouts.buttons_datatables',['id'=>$row['id'],'url'=>$url,'ticket'=>'1']);
        })->rawColumns(['action']);
        return $table->make(true);
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
            'codigo' => 'required|unique:tickets',
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
                $ticket->fill($all)->save();
            }else{
                return response()->json(['error'=>array('El usuario no existe')],422);
            }
            return response()->json(['success'=>'Ticket creado con exito','reload'=>1]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('tickets.view');
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
