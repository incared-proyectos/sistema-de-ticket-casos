<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Yajra\Datatables\Datatables;
use App\Models\User;
use App\Models\Categoria;
use App\Models\Categorias_has_user;

class UserController extends Controller
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
            array('data'=>'email'),
            array('data'=>'categorias'),
            array('data'=>'action'),
        );
        $head = array(
            'ID',
            'Name',
            'Email',
            'Categorias',
            'Action',
        );
        return view('users.index',[
            'columns'=>$columns,
            'head'=>$head ,
            'roles'=>Role::all(),
            'categoria'=>Categoria::all()
        ]);
    }
    public function datatables(){
        $id = Auth()->id();
        $table = Datatables::of(User::with('categorias')->where('id','!=',$id)->get());
        $table->addColumn('action', function($row){
            $url = url('usuarios').'/'.$row['id'];
            return view('layouts.buttons_datatables',['id'=>$row['id'],'url'=>$url]);
        })->editColumn('categorias', function($row){
            if (count($row['categorias']) > 0) {
                $message = '';
                foreach ($row['categorias'] as $c) {
                    $message .= view('layouts.categoria_datable',['nombre'=>$c->nombre]);
                }
                return $message;
            }
        })->rawColumns(['action','categorias']);
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
            'email'     => 'required|unique:users',
            'password' => 'required',
            'rol' => 'required',
            'categorias' => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else{
            $user = User::create([
                'name' => $all['name'],
                'email' => $all['email'],
                'sede' => $all['sede'],
                'direccion'=>$all['direccion'],
                'password'=>Hash::make($all['password']),
            ]);
            $user->assignRole($all['rol']);    
            for ($i=0; $i <count($all['categorias']) ; $i++) { 
                $categorias = new Categorias_has_user();
                $categorias->categoria_id = $all['categorias'][$i];
                $categorias->user_id = $user->id;
                $categorias->save();
            }
            return response()->json(['success'=>'Usuario creado con exito','reload'=>1]);
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
        $user = User::with('roles','categorias')->find($id);
        return view('users.edit',[
            'user'=>$user,
            'roles'=>Role::all(),
            'categorias'=>Categoria::all()
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
        $user = User::find($id);
        $validator = Validator::make($all,[
            'name' => 'required',
            'email'     => 'required',
            'rol' => 'required',
            'categorias' => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()->all()],422);
        }else{
            $all['password'] = (!empty($all['password'])) ? Hash::make($all['password']) : $user->password;
            $user->fill($all)->save();
            if (!empty($all['rol_actually'])) {
                # code...
                $user->removeRole($all['rol_actually']);
            }
            $user->assignRole($all['rol']);
            $categorias = Categorias_has_user::where('user_id',$id)->delete();
            for ($i=0; $i <count($all['categorias']) ; $i++) { 
                $categorias = new Categorias_has_user();
                $categorias->categoria_id = $all['categorias'][$i];
                $categorias->user_id = $user->id;
                $categorias->save();
            }
            return response()->json(['success'=>'Usuario actualizado con exito','reload'=>1]);
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
        $user = User::with('roles')->find($id);
        $rol = $user->roles[0]->name;
        $user->removeRole($rol);
        $categorias = Categorias_has_user::where('user_id',$id)->delete();
        if($user->delete()){ 
            return response()->json(['success'=>'Registro eliminado con exito','reload'=>1]);
        }

    }
}
