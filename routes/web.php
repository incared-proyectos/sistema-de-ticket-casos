<?php

use Illuminate\Support\Facades\Route;
use Laravel\Socialite\Facades\Socialite;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RolController;
use App\Http\Controllers\CategoriaController;
use App\Http\Controllers\TicketController;
use App\Http\Controllers\EstatusController;
use \Artisan as Artis; 
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
	return redirect('/login');

});

Auth::routes();

Route::get('login/{provider}/callback', [App\Http\Controllers\Auth\LoginController::class, 'handleProviderCallback'])->name('social.callback');

Route::get('google/auth/redirect', function () {
    return Socialite::driver('google')->redirect();
});

Route::get('facebook/auth/redirect', function () {
    return Socialite::driver('facebook')->redirect();
});

//Ruta para activar comando mediante cron job  hosting
Route::get('/jobemails', function () {
    Artis::call('work:email');
});


Route::get('/microsoft/signin', [App\Http\Controllers\Auth\MicrosoftController::class, 'signin']);
Route::get('/microsoft/callback', [App\Http\Controllers\Auth\MicrosoftController::class, 'callback']);


Route::group(['middleware' => 'auth'], function() {


	Route::group(['middleware' => ['role:administrador|tecnico']], function () {
		Route::get('/usuarios/datatables', [UserController::class, 'datatables']);


		Route::resource('/usuarios',UserController::class);

		Route::resource('/rol',RolController::class);

		Route::resource('/categorias',CategoriaController::class);

		Route::resource('/estatus',EstatusController::class);


		Route::post('/ticket/user_asigne', [App\Http\Controllers\TicketController::class, 'delete_user_asigne']);

		Route::post('/ticket/save_users', [App\Http\Controllers\TicketController::class, 'save_ticket_view']);

		Route::post('/status/ticket', [App\Http\Controllers\TicketController::class, 'change_status']);
	});

	Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');



	Route::get('/datatables/rol', [App\Http\Controllers\RolController::class, 'datatables']);

	Route::get('/datatables/categorias', [App\Http\Controllers\CategoriaController::class, 'datatables']);

	Route::get('/datatables/tickets', [TicketController::class, 'filter_datatable']);

	//Route::get('/datatables/permisos', [App\Http\Controllers\PermissionController::class, 'datatables']);

	Route::get('/datatables/estatus', [App\Http\Controllers\EstatusController::class, 'datatables']);

	//Route::get('/datatables/buttons', [App\Http\Controllers\ButtonsController::class, 'datatables']);

	Route::get('/datatables/tickets_filter', [App\Http\Controllers\TicketController::class, 'filter_datatable']);

	Route::get('/tickets_filter/{id}', [App\Http\Controllers\TicketController::class, 'filter_category']);

	Route::get('/print/ticket/{id}', [App\Http\Controllers\TicketController::class, 'export_pdf']);


	Route::post('/usuarios/search', [UserController::class, 'search']);

	Route::get('/perfil/sidebar', [App\Http\Controllers\PerfilController::class, 'sidebar_change']);

	Route::resources([
	    'perfil' => App\Http\Controllers\PerfilController::class,
	    'tickets' => App\Http\Controllers\TicketController::class,
	    'api/mensaje' => App\Http\Controllers\MensajeController::class,
	    //'buttons' => App\Http\Controllers\ButtonsController::class,
	    //'permisos' => App\Http\Controllers\PermissionController::class,
	]);
});
