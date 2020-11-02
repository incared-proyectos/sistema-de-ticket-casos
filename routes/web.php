<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();
Route::group(['middleware' => 'auth'], function() {


	Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

	Route::get('/usuarios/datatables', [App\Http\Controllers\UserController::class, 'datatables']);

	Route::get('/datatables/rol', [App\Http\Controllers\RolController::class, 'datatables']);

	Route::get('/datatables/permisos', [App\Http\Controllers\PermissionController::class, 'datatables']);

	Route::get('/datatables/tickets', [App\Http\Controllers\TicketController::class, 'datatables']);

	Route::resources([
	    'usuarios' => App\Http\Controllers\UserController::class,
	    'rol' => App\Http\Controllers\RolController::class,
	    'permisos' => App\Http\Controllers\PermissionController::class,
	    'perfil' => App\Http\Controllers\PerfilController::class,
	    'tickets' => App\Http\Controllers\TicketController::class,
	]);
});
