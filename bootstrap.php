<?php

// add credentials file
include 'config/credentials.php';

use Illuminate\Database\Capsule\Manager as Capsule;

// Eloquent configs
$capsule = new Capsule();
$capsule->addConnection([
    "driver"    => "mysql",
    "host"      => $db_host,
    "database"  => $db_name,
    "username"  => $db_user,
    "password"  => $db_pass,
    "charset"   => "utf8",
    "collation" => "utf8_general_ci",
    "prefix"    => ""
]);

$capsule->bootEloquent();