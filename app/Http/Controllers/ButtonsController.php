<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\Datatables\Datatables;
use App\Models\Button;
use App\Models\Categoria;
use App\Models\User;
class ButtonsController extends Controller
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
    
        return view('buttons.index',[
            'columns'=> $heads['columns'],
            'head'=>$heads['head'],
        ]);    
    }

    public function head_datatables(){
        $columns = array(
            array('data'=>'id'),
            array('data'=>'nombre'),
            array('data'=>'icon'),
            array('data'=>'class'),
            array('data'=>'url_to'),
            array('data'=>'action'),
        );
        $head = array(
            'ID',
            'Nombre',
            'Icono',
            'Classes',
            'URL',
            'Action',
        );
        return array('columns'=>$columns,'head'=>$head);
    }

    public function datatables(){
        $table = Datatables::of(Button::all());
        $table->addColumn('action', function($row){
            $url = url('tickets').'/'.$row['id'];
            return view('layouts.buttons_datatables',['id'=>$row['id'],'url'=>$url]);
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
        $all =  $request->all();
        $button = new Button();
        $validator = Validator::make($all,[
            'url_to' => 'required',
            'class'  => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else{
            $button->fill($all)->save();
            return response()->json(['success'=>'Buttons creado con exito','reload'=>1]);
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
        //
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
