<?php

namespace Wishlist\Models;
use \Illuminate\Database\Eloquent\Model;

class User extends Model{

    protected $table = "wl_user";

    // the authentication method to find a match api key in user table
    public function authenticate($apiKey){
        $user = User::where('apikey', 'LIKE' , $apiKey)->take(1)->get();
        return ($user[0]->exists) ? true : false;
    }
}