<?php

namespace Wishlist\Middleware;
use Wishlist\Models\User;

class Authentication
{
    public function __invoke($request, $response, $next)
    {
        // get api token send through header
        $auth = $request->getHeader('Authorization');
        $_apiKey = $auth[0];
        // remove the bearer part from string
        $apiKey = substr($_apiKey, strpos($_apiKey, ' ') + 1);

        // to call the authorize function of user model to validate
        $user = new User();
        if (!$user->authenticate($apiKey)) {
            $response = $response->withStatus(401); // not authorized
            return $response;
        }else{
            $response = $next($request, $response);
            return $response;
        }
    }
}