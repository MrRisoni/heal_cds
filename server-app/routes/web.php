<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MRTController;
use App\Http\Controllers\RaidController;
use App\Http\Controllers\SpellController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// http://localhost:8000/mrt/boss/6
Route::get('/mrt/boss/{id}', [MRTController::class, 'export']);


// http://localhost:8000/raid/4
Route::get('/raid/{id}', [RaidController::class, 'bosses']);



// http://localhost:8000/boss/6
Route::get('/abilities/{id}', [RaidController::class, 'abilities']);


Route::get('/spells', [SpellController::class, 'spells']);


// http://localhost:8000/mrt/boss/assigns/6
Route::get('/mrt/boss/assigns/{id}', [MRTController::class, 'assignments']);

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
