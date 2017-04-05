<?php

namespace Wishlist\Models;
use \Illuminate\Database\Eloquent\Model;

class Wishlist extends Model {

    protected $table = "wl_wishlist";

    // relation ship with wl_user
    public function user(){
        return $this->hasOne('Wishes\Models\User', 'id', 'wl_user_id');
    }
}

