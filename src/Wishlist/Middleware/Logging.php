<?php

namespace Wishlist\Middleware;

class Logging{

    public function __invoke($request, $response, $next){
        // log data to php log for request.
        error_log($request->getMethod() . ' : ' . $request->getUri());
        $response = $next($request, $response);

        return $response;
    }
}