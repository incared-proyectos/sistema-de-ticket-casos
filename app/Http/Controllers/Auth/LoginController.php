<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Auth;
use Hash;
use Laravel\Socialite\Facades\Socialite;
use Str;
use App\Models\User;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function handleProviderCallback($provider) {
      // Obtenemos los datos del usuario
      $social_user = Socialite::driver($provider)->stateless()->user();
      //dd($user); // Sirve para visualizar que llega el callback antes de seguir con el codigo 

      if ($user = User::where('email', $social_user->email)->first()) { 
        return $this->authAndRedirect($user); // Login y redirección
      } else {
         // add user to database
          if ($social_user->getName()==null) {
            $social_user->name = $social_user->nickname;
          } 
          $user = User::create([
            // 'token' => $user->token;
            'name' => $social_user->getName(),
            'email' => $social_user->getEmail(),
            'password' => Hash::make(Str::random(24)),
          ]);
          return $this->authAndRedirect($user); // Login y redirección
      }
    }

    // Login y redirección
    public function authAndRedirect($user) {
      Auth::login($user);
      return redirect($this->redirectTo);
    }
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
}
