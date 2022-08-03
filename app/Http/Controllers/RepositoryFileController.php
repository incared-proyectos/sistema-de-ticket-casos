<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\RepositoryFile;
use Illuminate\Support\Facades\Storage;
use Throwable;

class RepositoryFileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $repositoryFile = RepositoryFile::paginate(20);
        return view('repository/index',compact('repositoryFile'));
    }
    /**
     * Obtenemos el listado de  archivos
     *
     * @return Collection
    */
    public function list(Request $request)
    {
        $repositoryFile = RepositoryFile::where('user_id',auth()->id());
        if(!empty($request->searchname)){
            $repositoryFile->where('original_name','LIKE','%'.$request->searchname.'%');
        }
        return $repositoryFile->paginate(20);
    }
    /**
     * Obtenemos el respositorio consultado por id
     * @param RepositoryFile $repositoryId
     * @return Object
    */
    public function getById(RepositoryFile $repositoryFile){
        return $repositoryFile;
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
        try{

            if ($request->hasFile('file')) {
                $file = $request->file('file');
                $requestSave['original_name'] = $file->getClientOriginalName();
                $requestSave['type_file'] = $file->getClientOriginalExtension();
                $requestSave['user_id'] = auth()->id();
                $requestSave['src_file'] = 'll';
                $extension = $file->getClientOriginalExtension();
                $allowedfileExtension=['jpg','png','jpeg','gif','pdf','docx'];
                $check=in_array($extension,$allowedfileExtension);
                if ($check) {
                    $name = $file->store('repository/'.auth()->id(),['disk' => 'public_uploads']);
                    $nom_img = explode('/',$name);
                    $nameFiles = $nom_img[2];
                }else{
                    return response()->json(['errors'=>array('Ooops el archivo '.$file->getClientOriginalName().' tiene un formato no permitido')],422);
                }
                $requestSave['name_file'] = $nameFiles;
                $requestSave['src_file'] = $nameFiles;
                RepositoryFile::create($requestSave);

            }
        }catch (Throwable $e) {
            return response()->json(['errors'=>array('Ooops tenemos un error, contacte con el programador')],500);
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
        try{
            $repositoryFile = RepositoryFile::find($id);
            $all = $request->all();
            $edit = false;
            $editName = false;
            if($repositoryFile->original_name != $all['original_name']){
                $requestSave['original_name'] = $all['original_name'];
                $editName = true;
                $edit =true;
            }

            if ($request->hasFile('file')) {
                $edit = true;
                $file = $request->file('file');
                $requestSave['type_file'] = $file->getClientOriginalExtension();
                $requestSave['user_id'] = auth()->id();

                $exists = Storage::disk('public_uploads')->exists('repository/'.$repositoryFile->user_id.'/'.$repositoryFile->src_file);
                if ($exists) {
                    Storage::disk('public_uploads')->delete('repository/'.$repositoryFile->user_id.'/'.$repositoryFile->src_file);
                }
                
                if(!$editName){
                    $requestSave['original_name'] =$file->getClientOriginalName();
                }
                $extension = $file->getClientOriginalExtension();
                $allowedfileExtension=['jpg','png','jpeg','gif','pdf','docx'];
                $check=in_array($extension,$allowedfileExtension);
                if ($check) {
                    $name = $file->store('repository/'.auth()->id(),['disk' => 'public_uploads']);
                    $nom_img = explode('/',$name);
                    $nameFiles = $nom_img[2];
                }else{
                    return response()->json(['errors'=>array('Ooops el archivo '.$file->getClientOriginalName().' tiene un formato no permitido')],422);
                }
                $requestSave['name_file'] = $nameFiles;
                $requestSave['src_file'] = $nameFiles;
            }
            if(!empty($repositoryFile) && $edit){
                $repositoryFile->fill($requestSave)->save();
            }
        }catch (Throwable $e) {
            return response()->json(['errors'=>array('Ooops tenemos un error, contacte con el programador')],500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(RepositoryFile $repositoryFile)
    {
        $exists = Storage::disk('public_uploads')->exists('repository/'.$repositoryFile->user_id.'/'.$repositoryFile->src_file);
        if ($exists) {
            Storage::disk('public_uploads')->delete('repository/'.$repositoryFile->user_id.'/'.$repositoryFile->src_file);
        }
        

        $repositoryFile->delete();
    }
}
