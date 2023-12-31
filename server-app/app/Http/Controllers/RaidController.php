<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Boss;
use App\Models\BossAbility;
use App\Models\BossTimer;
use App\Models\Assignment;

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
         s.friendly_spell_id,s.title AS friendlyName,s.filename,t.timer
     FROM boss_timing t 
     JOIN boss_abilities ba ON ba.id = t.ability_id
     LEFT JOIN assignments a ON a.timer_id = t.id
     LEFT JOIN players p ON p.id = a.player_id
     LEFT JOIN spells s ON s.id = a.heal_spell_id
     WHERE ba.boss_id  =:boss_id AND (a.plan_id =:plan_id OR a.plan_id IS NULL)
 
 UNION 
 
      SELECT t.stamp, '' AS enemy_spell_id,'' AS enemy_color, '' AS short_title , 'ff' AS color,'test' AS name, 
         s.friendly_spell_id,s.title AS friendlyName,s.filename,t.timer
     FROM custom_timers t 
      JOIN spells s ON s.id = t.spell_id
     WHERE t.boss_id  =:boss_id2 AND t.plan_id =:plan_id2
      ORDER BY timer ASC ";


      $bossObj = Boss::find($bossId);


    return view('raid_plan', ['bossObj' => $bossObj,
        'assignments' => DB::select($planSQL,["boss_id" => $bossId,'plan_id' => $planId,
    "boss_id2" => $bossId,'plan_id2' => $planId])]);
    }

    public function add_timer(int $boss_id)
    {
       
        return view('add_timer', ['boss_id' =>$boss_id, 'abilities' => 
        DB::select('SELECT * FROM boss_abilities WHERE boss_id = :id ORDER BY short_title ASC',['id' => $boss_id])]);
        
    }



    public function add_cd(int $boss_id,int $spec_id)
    {
       
        return view('add_cd', [
            'spells' => DB::select("SELECT s.id,s.title 
            FROM spells s WHERE s.spec_id = :spec_id ORDER BY s.title ASC",['spec_id' => $spec_id]),
            
            
            'timers' => 
        DB::select('SELECT t.id,t.stamp,ba.short_title FROM `boss_timing` t
        JOIN boss_abilities ba ON ba.id = t.ability_id
        WHERE ba.boss_id = :id
        ORDER BY t.order_id ASC ',['id' => $boss_id])]);
        
    }

    public function save_cd(Request $request)
    {
   

       $assign = new Assignment();
       $assign->timer_id =  $request->input('timerSelectId');
       $assign->heal_spell_id = $request->input('spellSelectId');
       
       $assign->save();

    }

    public function save_timer(Request $request)
    {

        $stampText = $request->input('stampText');


        $bossId = $request->input('bossId');
        $abilitySelectId = $request->input('abilitySelectId');
        
        $nextOrderId = DB::select(" SELECT 
                                    IF ( MAX(order_id)  IS NULL,1,MAX(order_id)+1)
                                    AS nextOrderId
                                    FROM boss_timing t
                                    JOIN  boss_abilities ba ON t.ability_id = ba.id
                                    WHERE ba.boss_id = 3 LIMIT 1 ")[0]->nextOrderId;


$tim = new BossTimer();
$tim->ability_id =$abilitySelectId;
$tim->stamp = $stampText;
$tim->order_id = $nextOrderId;
$tim->save();
    }




    
    public function custom(int $planId,int $bossId)
    {

         $planSQL = " 
         SELECT t.stamp, '' AS enemy_spell_id,'' AS enemy_color, '' AS short_title , l.color,l.name , 
         s.friendly_spell_id,s.title AS friendlyName,s.filename,t.timer
     FROM custom_timers t 
      JOIN spells s ON s.id = t.spell_id
      JOIN players l ON l.spec_id = s.spec_id
     WHERE t.boss_id  =:boss_id AND t.plan_id =:plan_id
      ORDER BY timer ASC ";


      $bossObj = Boss::find($bossId);


    return view('raid_plan', ['bossObj' => $bossObj,
        'assignments' => DB::select($planSQL,["boss_id" => $bossId,'plan_id' => $planId])]);
    }
}

?>