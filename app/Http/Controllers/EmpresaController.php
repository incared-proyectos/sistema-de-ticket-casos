<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\EmpresaRequest;
use App\Http\Requests\EmpresaUpdateRequest;
use App\Models\Empresa;
use Yajra\Datatables\Datatables;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use Throwable;

class EmpresaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $heads = $this->head_datatables();

        return view('empresa/index',[
            'columns'=> $heads['columns'],
            'head'=>$heads['head'],
        ]);
    }

    
    public function head_datatables(){
        $columns = array(
            array('data'=>'id'),
            array('data'=>'name'),
            array('data'=>'surname'),
            array('data'=>'ruc'),
            array('data'=>'action'),

        );
        $head = array(
            'ID',
            'Nombre',
            'Apellido',
            'Identificacion',
            'Action',
        );
        return array('columns'=>$columns,'head'=>$head);
    }
    /** 
     * Datatable para  empresa
     * @return Collection
    */
    public function datatables(){
        $table = Datatables::of(Empresa::all());
        $table->addColumn('action', function($row){
            $url = url('empresa').'/'.$row['id'];
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
        return view('empresa/create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(EmpresaRequest $request)
    {
        try{

            $all = $request->all();

            DB::beginTransaction();

            $empresa = Empresa::create($all);

            if ($request->hasFile('logo')) {

                $files = $request->file('logo');
                $extension = $files->getClientOriginalExtension();
                $allowedfileExtension=['jpg','png','jpeg','gif'];
                $check=in_array($extension,$allowedfileExtension);
                if ($check) {
                    $name = $files->store('empresa/'.$empresa->id,['disk' => 'public_uploads']);
                    $nom_img = explode('/',$name);
                    $nameLogo = $nom_img[2];
                }
                $empresa->logo = $nameLogo;
                $empresa->save();
            }

            DB::commit();
            Session::flash('success','La empresa fue creado con exito'); 

            return response()->json(['success'=>'Empresa creado con exito']);
        }catch (Throwable $e) {
            DB::rollBack();
            return response()->json(['errors'=>array('Ooops tenemos un error, contacte con el programador')],422);
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
    public function edit(Empresa $empresa)
    {
        return view('empresa/edit', compact('empresa'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(EmpresaUpdateRequest $request, Empresa $empresa)
    {
        try{

            $all = $request->all();
        
            DB::beginTransaction();
            if ($request->hasFile('logo')) {
                
                $exists = Storage::disk('public_uploads')->exists('empresa/'.$empresa->id.'/'.$empresa->logo);
                if ($exists) {
                    Storage::disk('public_uploads')->delete('empresa/'.$empresa->id.'/'.$empresa->logo);
                }

                $files = $request->file('logo');
                $extension = $files->getClientOriginalExtension();
                $allowedfileExtension=['jpg','png','jpeg','gif'];
                $check=in_array($extension,$allowedfileExtension);
                if ($check) {
                    $name = $files->store('empresa/'.$empresa->id,['disk' => 'public_uploads']);
                    $nom_img = explode('/',$name);
                    $nameLogo = $nom_img[2];
                }
                $all['logo'] = $nameLogo;
            }

            $empresa->fill($all)->save();


            DB::commit();

            return response()->json(['success'=>'Empresa actualizada con exito']);
        }catch (Throwable $e) {
            DB::rollBack();
            return response()->json(['errors'=>array('Ooops tenemos un error, contacte con el programador')],422);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Empresa $empresa)
    {   
        $exists = Storage::disk('public_uploads')->exists('empresa/'.$empresa->id.'/'.$empresa->logo);
        if ($exists) {
            Storage::disk('public_uploads')->delete('empresa/'.$empresa->id.'/'.$empresa->logo);
        }
        
        $empresa->delete();
    }
}
