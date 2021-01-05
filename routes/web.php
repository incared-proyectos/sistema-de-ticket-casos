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

	Route::post('/usuarios/search', [App\Http\Controllers\UserController::class, 'search']);

	Route::get('/datatables/rol', [App\Http\Controllers\RolController::class, 'datatables']);

	Route::get('/datatables/categorias', [App\Http\Controllers\CategoriaController::class, 'datatables']);

	Route::get('/datatables/tickets', [App\Http\Controllers\TicketController::class, 'filter_datatable']);

	Route::get('/datatables/tickets_filter', [App\Http\Controllers\TicketController::class, 'filter_datatable']);

	Route::get('/tickets_filter/{id}', [App\Http\Controllers\TicketController::class, 'filter_category']);

	Route::get('/status/ticket/{id}', [App\Http\Controllers\TicketController::class, 'change_status']);

	Route::get('/print/ticket/{id}', [App\Http\Controllers\TicketController::class, 'export_pdf']);


	Route::resources([
	    'usuarios' => App\Http\Controllers\UserController::class,
	    'rol' => App\Http\Controllers\RolController::class,
	    'categorias' => App\Http\Controllers\CategoriaController::class,
	    'perfil' => App\Http\Controllers\PerfilController::class,
	    'tickets' => App\Http\Controllers\TicketController::class,
	    'api/mensaje' => App\Http\Controllers\MensajeController::class,
	]);
});
