<?php

namespace Wishlist\Controllers\v1;

// eloquent wish model
use Wishlist\Models\Wish;

class WishController {

    public function getWishlistWishes($request, $response, $args){
        $wishlistId = $args['wishlistId']; // get wishlist id from url args

        $wishes = Wish::where('wl_wishlist_id', '=', $wishlistId)
            ->select('id', 'name', 'description')
            ->get();

        return $response->withStatus(200)->withJson($wishes);
    }

    public function createWish($request, $response, $args){
        $json = $request->getBody(); // get post data
        $data = json_decode($json, true);

        $wish = new Wish();
        $wish->name = $data['name'];
        $wish->description = $data['description'];
        $wish->wl_wishlist_id = $data['wl_wishlist_id'];
        $wish->save();

        if($wish->id) {
            return $response->withStatus(201); // created
        }else{
            return $response->withStatus(400); // bad request
        }
    }

    public function updateWish($request, $response, $args){
        $wishId = $args['wishId'];// get wish id from url args
        $json = $request->getBody();// get put data
        $data = json_decode($json, true);
        $wish = Wish::find($wishId);// find by primary key
        if ($wish->exists) {

            $wish->name = $data['name'];
            $wish->description = $data['description'];
            $wish->save();

            return $response->withStatus(200);
        }else{
            return $response->withStatus(400);
        }
    }

    public function deleteWish($request, $response, $args){
        $wishId = $args['wishId'];// get wish id from url args
        $wish = Wish::find($wishId); // find by primary key

        if ($wish->exists) {
            $wish->delete();
            return $response->withStatus(204); // ok with no content
        }else{
            return $response->withStatus(400); // bad request
        }
    }

    public function getWishes($request, $response, $args){
        return $response->withStatus(501); // not implemented sample
    }
}