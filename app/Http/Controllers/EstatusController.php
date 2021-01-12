<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Estatu;
use Yajra\Datatables\Datatables;

class EstatusController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $heads = $this->head_datatables();
        return view('estatus.index',[
            'columns'=> $heads['columns'],
            'head'=>$heads['head'],
        ]);
    }
    public function head_datatables(){
        $columns = array(
            array('data'=>'id'),
            array('data'=>'nombre'),
            array('data'=>'action'),

        );
        $head = array(
            'ID',
            'Nombre Estatus',
            'Action',
        );
        return array('columns'=>$columns,'head'=>$head);
    }
    public function datatables(){
        $table = Datatables::of(Estatu::all());
        $table->addColumn('action', function($row){
            $url = url('estatus').'/'.$row['id'];
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
        $validator = Validator::make($all,[
            'nombre' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else{
            $role = Estatu::create([
                'nombre' => $all['nombre'],
                'color' => $all['color'],
            ]);
            return response()->json(['success'=>'Estatus creado con exito','reload'=>1]);
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
        $item = Estatu::find($id);
        return view('estatus.edit',['estatus' => $item]);    
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
        $all = $request->all();
        $estatus = Estatu::find($id);

        $validator = Validator::make($all,[
            'nombre' => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else if (Estatu::where('nombre', '=', $all['nombre'])->where('id','!=',$estatus->id)->count() > 0) {
            return response()->json(['error'=>array('El estatus  '.$all['nombre'].' ya existe')],422);
        }else{
            $estatus->nombre = $all['nombre'];
            $estatus->color = $all['color'];
            $estatus->save();
            return response()->json(['success'=>'Estatus actualizado con exito','reload'=>1]);
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
        $estatus = Estatu::find($id);
        if(!empty($estatus)){
            $estatus->delete();
        }
    }
}
