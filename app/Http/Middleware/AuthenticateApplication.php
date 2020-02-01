<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use JWTAuth;
use Exception;

class AuthenticateApplication
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = 'web')
    {
    		// if(config('app.env') == 'production') {
	     //    if (Auth::guard($guard)->guest()) {
	     //        if ($request->ajax() || $request->wantsJson()) {
	     //            return response('Unauthorized. [loginMark]', 401);
	     //        } else {
	     //            return redirect()->guest('login');
	     //        }
	     //    }
	     //  }

        return $next($request);
    }
}
