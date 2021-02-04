<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Ticket;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {       
        $count_user = User::all()->count();
        $count_ticket = Ticket::all()->count();
        $count_ticket_realizado = Ticket::where('status','Realizado')->count();
        $count_ticket_activo = Ticket::where('status','Activo')->count();


        return view('home',['user_c'=>$count_user,'ticket'=>$count_ticket,'resueltos'=>$count_ticket_realizado,'activos'=>$count_ticket_activo]);
    }
}
