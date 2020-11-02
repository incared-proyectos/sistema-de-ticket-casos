<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Permission;
use Yajra\Datatables\Datatables;

class PermissionController extends Controller
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
            array('data'=>'name'),
            array('data'=>'action'),
        );
        $head = array(
            'ID',
            'Name',
            'Action',
        );
        return view('permisos.index',
            [
            'columns'=>$columns,
            'head'=>$head
            ]
        );
    }
    public function datatables(){
        $table = Datatables::of(Permission::all());
        $table->addColumn('action', function($row){
            $url = url('permisos').'/'.$row['id'];
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
            'name' => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else{
            $role = Permission::create(['name' => $all['name']]);
            return response()->json(['success'=>'Rol creado con exito','reload'=>1]);
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
        $permisos = Permission::find($id);
        return view('permisos.edit',['permisos'=>$permisos]);
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
        $permission = Permission::find($id);

        $validator = Validator::make($all,[
            'name' => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else if (Permission::where('name', '=', $all['name'])->where('id','!=',$permission->id)->count() > 0) {
            return response()->json(['error'=>array('El permisos '.$all['name'].' ya existe')],422);
        }else{
            $permission->name = $all['name'];
            $permission->save();
            return response()->json(['success'=>'Permiso actualizado con exito','reload'=>1]);
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
        $permisos = Permission::find($id);
        if (!empty($permisos)) {
            $permisos->delete();
            return response()->json(['success'=>'Registro eliminado con exito','reload'=>1]);
        }
    }
}
