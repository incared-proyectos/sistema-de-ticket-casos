<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\RepositoryFile;
class RepositoryFileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $repositoryFile = RepositoryFile::all();
        return view('repository/index',compact('repositoryFile'));
    }
    /**
     * Obtenemos el listado de  archivos
     *
     * @return Collection
    */
    public function list()
    {
        $repositoryFile = RepositoryFile::where('user_id',auth()->id())->get();
        return $repositoryFile;
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

        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $requestSave['original_name'] = $file->getClientOriginalName();
            $requestSave['type_file'] = $file->getClientOriginalExtension();
            $requestSave['user_id'] = auth()->id();
            $requestSave['src_file'] = 'll';
            $extension = $file->getClientOriginalExtension();
            $allowedfileExtension=['jpg','png','jpeg','gif','pdf'];
            $check=in_array($extension,$allowedfileExtension);
            if ($check) {
                $name = $file->store('repository/'.auth()->id(),['disk' => 'public_uploads']);
                $nom_img = explode('/',$name);
                $nameFiles = $nom_img[2];
            }
            $requestSave['name_file'] = $nameFiles;
            $requestSave['src_file'] = $nameFiles;
            RepositoryFile::create($requestSave);

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
