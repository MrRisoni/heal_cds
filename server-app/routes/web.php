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

// http://localhost:8000/plan/2/boss/1
Route::get('/plan/{plan_id}/boss/{boss_id}', [MRTController::class, 'plan']);



// http://localhost:8000/custom_mrt/1/boss/9
Route::get('/custom_mrt/{plan_id}/boss/{boss_id}', [MRTController::class, 'custom']);