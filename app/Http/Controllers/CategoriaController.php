<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Categoria;
use Yajra\Datatables\Datatables;

class CategoriaController extends Controller
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
            array('data'=>'nombre'),
            array('data'=>'action'),
        );
        $head = array(
            'ID',
            'Nombre',
            'Action',
        );
        return view('categoria.index',
            [
            'columns'=>$columns,
            'head'=>$head
            ]
        );
    }


    public function datatables(){
        $table = Datatables::of(Categoria::all());
        $table->addColumn('action', function($row){
            $url = url('categorias').'/'.$row['id'];
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
            $role = Categoria::create(['nombre' => $all['nombre']]);
            return response()->json(['success'=>'Categoria creada con exito','reload'=>1]);
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
        $categoria = Categoria::find($id);
        return view('categoria.edit',['categoria'=>$categoria]);
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
        $categoria = Categoria::find($id);

        $validator = Validator::make($all,[
            'nombre' => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else if (Categoria::where('nombre', '=', $all['nombre'])->where('id','!=',$categoria->id)->count() > 0) {
            return response()->json(['error'=>array('La categoria '.$all['nombre'].' ya existe')],422);
        }else{
            $categoria->nombre = $all['nombre'];
            $categoria->save();
            return response()->json(['success'=>'Categoria actualizado con exito','reload'=>1]);
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
        $categoria = Categoria::find($id);
        if (!empty($categoria)) {
            $categoria->delete();
            return response()->json(['success'=>'Registro eliminado con exito','reload'=>1]);
        }
    }
}
