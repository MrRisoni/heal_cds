<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
       
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $bossId = 4; // larodar
        $timers =  DB::select("SELECT ta.stamp,ba.full_name
        FROM boss_timing ta
        JOIN boss_abilities ba ON ba.id = ta.ability_id
        WHERE ba.boss_id =:id
        ORDER BY ta.order_id ASC",["id" => $bossId]);
        
        var_dump($timers);
        
        return view('home',['timers' => $timers]);
    }
}
