<?php

require 'vendor/autoload.php';
include 'bootstrap.php';

// middleware
use Wishlist\Middleware\Logging as Logging;
use Wishlist\Middleware\Authentication as Authentication;

// instantiate slim framework with debugging enabled, change to false for production
$app = new \Slim\App(['settings' => ['displayErrorDetails' => true]]);

$app->add(new Logging());// to log the requests
$app->add(new Authentication());// Middleware to authenticate access with api key.

// version 1 route group
$app->group('/v1', function () use ($app) {
    $wishController = 'Wishlist\Controllers\v1\WishController'; // v1 class for wish route functions

    // APIs for wishes from a wishlist
    $app->get ('/wishlist/{wishlistId}/wishes',    $wishController.':getWishlistWishes');// get a wishlist wishes
    $app->post('/wishlist/wishes',                 $wishController.':createWish');// create a wish
    $app->put ('/wishlist/wishes/{wishId}',        $wishController.':updateWish');// update a wish
    $app->delete('/wishlist/wishes/{wishId}',      $wishController.':deleteWish');// delete a wish

    // functionality not implemented , to be done next
    $app->get ('/wishlists/wishes',                $wishController.':getWishes');// get all wishes

    // TODO : create rest of the APIs for user wishlists, add remove and update etc
});

// version 2 route group
$app->group('/v2', function () use ($app) {
    $wishController = 'Wishlist\Controllers\v2\WishController'; // v1 class for wish route functions

    // APIs for wishes from a wishlist
    $app->get ('/wishlist/{wishlistId}/wishes',    $wishController.':getWishlistWishes');// get a wishlist wishes
    $app->post('/wishlist/wishes',                 $wishController.':createWish');// create a wish
    $app->put ('/wishlist/wishes/{wishId}',        $wishController.':updateWish');// update a wish
    $app->delete('/wishlist/wishes/{wishId}',      $wishController.':deleteWish');// delete a wish

    // functionality not implemented , to be done next
    $app->get ('/wishlists/wishes',                $wishController.':getWishes');// get all wishes

    // TODO : create rest of the APIs for user wishlists, add remove and update etc
});

// to run the slim framework
$app->run();