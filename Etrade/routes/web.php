<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});



Route::get('home','App\Http\Controllers\Ecomm@home')->name('home');

Route::get('product_delete/{id}','App\Http\Controllers\Ecomm@product_delete')->name('product_delete');

Route::get('product_details/{id}','App\Http\Controllers\Ecomm@product_details')->name('product_details');

Route::get('category_details/{id}','App\Http\Controllers\Ecomm@category_details')->name('category_details');

Route::get('insert_product','App\Http\Controllers\Ecomm@insert_product')->name('insert_product');

Route::post('do_insert','App\Http\Controllers\Ecomm@do_insert')->name('do_insert');

Route::get('edit_product/{id}','App\Http\Controllers\Ecomm@edit_product')->name('edit_product');

Route::post('do_edit/{id}','App\Http\Controllers\Ecomm@do_edit')->name('do_edit');

Route::get('search_products','App\Http\Controllers\Ecomm@search_products')->name('search_products');


Route::get('signup','App\Http\Controllers\Ecomm@signup')->name('signup');

Route::post('do_signup','App\Http\Controllers\Ecomm@do_signup')->name('do_signup');

Route::get('logout','App\Http\Controllers\Ecomm@logout')->name('logout');

Route::get('login','App\Http\Controllers\Ecomm@login')->name('login');

Route::post('do_login','App\Http\Controllers\Ecomm@do_login')->name('do_login');

////////////////////////////////////////////////////////////////////////////////////////////////

Route::get('whome','App\Http\Controllers\Etrade@whome')->name('whome');

Route::get('single_product/{id}','App\Http\Controllers\Etrade@single_product')->name('single_product');

Route::get('resgister_form','App\Http\Controllers\Etrade@resgister_form')->name('resgister_form');

Route::post('do_register','App\Http\Controllers\Etrade@do_register')->name('do_register');

Route::get('w_login','App\Http\Controllers\Etrade@login')->name('w_login');

Route::post('w_do_login','App\Http\Controllers\Etrade@w_do_login')->name('w_do_login');

Route::get('w_logout','App\Http\Controllers\Etrade@logout')->name('w_logout');

Route::get('add_to_cart/{id}','App\Http\Controllers\Etrade@add_to_cart')->name('add_to_cart');

Route::get('remove_cart_item/{id}','App\Http\Controllers\Etrade@remove_cart_item')->name('remove_cart_item');



Route::get('checkout','App\Http\Controllers\Etrade@checkout')->name('checkout');

Route::post('place_order','App\Http\Controllers\Etrade@place_order')->name('place_order');

Route::get('myaccount','App\Http\Controllers\Etrade@myaccount')->name('myaccount');

Route::get('order_details/{id}','App\Http\Controllers\Etrade@order_details')->name('order_details');
