<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



Route::get('home','App\Http\Controllers\Food_api@home')->name('home');
Route::get('states','App\Http\Controllers\Food_api@states')->name('states');
Route::get('categorys','App\Http\Controllers\Food_api@categorys')->name('state');