<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Boss;
use App\Models\BossAbility;
use App\Models\BossTimer;
use Illuminate\Support\Facades\DB;

class RaidController extends Controller
{
   
    public function bosses(int $id)
    {
        return  Boss::where('raid_id', $id)->get();

    }

    public function abilities(int $id)
    {
        return  Boss::where('id', $id)->with('abilities')->get()->toArray();
    }

    public function timers(int $bossId)
    {

                
        return view('boss_timers',['timers' => DB::select("SELECT ta.id,ta.stamp,ba.full_name
        FROM boss_timing ta
        JOIN boss_abilities ba ON ba.id = ta.ability_id
        WHERE ba.boss_id =:id
        ORDER BY ta.order_id ASC",["id" => $bossId])]);


         
    }


    public function plan(int $planId,int $bossId)
    {

         $planSQL = "
        SELECT t.stamp,ba.enemy_spell_id,ba.enemy_color, ba.short_title , p.color,p.name, 
        s.friendly_spell_id,s.title AS friendlyName,s.filename
    FROM boss_timing t 
    JOIN boss_abilities ba ON ba.id = t.ability_id
    LEFT JOIN assignments a ON a.timer_id = t.id
    LEFT JOIN players p ON p.id = a.player_id
    LEFT JOIN spells s ON s.id = a.heal_spell_id
    WHERE ba.boss_id  =:boss_id AND (a.plan_id =:plan_id OR a.plan_id IS NULL)
    ORDER BY t.order_id ASC ";


    return view('raid_plan', ['assignments' => DB::select($planSQL,["boss_id" => $bossId,'plan_id' => $planId])]);
    }

    public function add_timer(int $boss_id)
    {
       
        return view('add_timer', ['abilities' => BossAbility::all()]);

    }
}

?>