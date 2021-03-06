<?php

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

Route::get('input', 'InputController@create');
Route::post('store', 'InputController@store');

Route::get('/', 'ViewController@index');
Route::get('search', 'ViewController@result');
Route::get('diagram', 'ViewController@diagram');
Route::get('table', 'ViewController@table');
Route::get('similarity', 'ViewController@similarity');
Route::get('deleteSimilarity', 'ViewController@deleteSimilarity');
Route::get('deleteResult', 'ViewController@deleteResult');