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

// http://localhost:8000/mrt/boss/6/plan/2
Route::get('/mrt/boss/{boss_id}/plan/{plan_id}', [MRTController::class, 'export']);


// http://localhost:8000/raid/4
Route::get('/raid/{id}', [RaidController::class, 'bosses']);



// http://localhost:8000/boss/1/timers
Route::get('/boss/{id}/timers', [RaidController::class, 'timers']);


Route::get('/spells', [SpellController::class, 'spells']);


// http://localhost:8000/mrt/boss/assigns/6
Route::get('/mrt/boss/assigns/{id}', [MRTController::class, 'assignments']);


Route::get('/', [App\Http\Controllers\HomeController::class, 'index']);



//http://localhost:8000/boss/3/add_timer
Route::get('/boss/{boss_id}/add_timer', [RaidController::class, 'add_timer']);

// http://localhost:8000/boss/save_timer
Route::post('/save_timer', [RaidController::class, 'save_timer']);



//http://localhost:8000/boss/1/spec/1/add_cd
Route::get('/boss/{boss_id}/spec/{spec_id}/add_cd', [RaidController::class, 'add_cd']);

// http://localhost:8000/plan/save_cd
Route::post('/plan/save_cd', [RaidController::class, 'save_cd']);

// http://localhost:8000/plan/2/boss/1
Route::get('/plan/{plan_id}/boss/{boss_id}', [RaidController::class, 'plan']);
