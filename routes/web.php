<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::resource('/jabatan', 'JabatanController');
Route::resource('/golongan', 'GolonganController');
Route::resource('/pegawai', 'PegawaiController');
Route::resource('/kategori', 'KategoriController');
Route::resource('/lemburpegawai', 'LemburpegawaiController');
Route::resource('/tunjangan','TunjanganController');
Route::resource('/tunjanganpegawai','tunjanganpegawaiController');
Route::resource('/penggajian', 'PenggajianController');
Route::resource('/home', 'HomeController@index');

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

// Route::group(['middleware' => ['api']], function () {
//     Route::post('register', 'ApiController@register');
//     Route::post('login', 'ApiController@login');
//     Route::group(['middleware' => 'jwt-auth'], function () {
//     	Route::post('get_user_details', 'ApiController@get_user_details');
//     });
// });
