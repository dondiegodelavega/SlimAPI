<?php

namespace Wishlist\Models;
use \Illuminate\Database\Eloquent\Model;

class Wish extends Model {

    protected $table = "wl_wish";

    // relation ship with wl_user
    public function wishlist(){
        return $this->hasOne('Wishes\Models\Wishlist', 'id', 'wl_wishlist_id');
    }
}

