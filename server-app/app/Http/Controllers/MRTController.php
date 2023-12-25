<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Assignment;


class MRTController extends Controller
{
   
    private  $planSQL = "
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




    public function export(int $boss_id,int $plan_id)
    {
        $results =  DB::select($this->planSQL,
        ["boss_id" => $boss_id,'plan_id' => $plan_id,
        "boss_id2" => $boss_id,'plan_id2' => $plan_id]);

      $mrtArray = [];
foreach ($results as $row ) {
//  {time:03:58}{spell:420846} |cffCC0000Phase 2 Dmg|r - |cfffefefeAkumai|r {spell:246287}  
   
    $mrtArray[] = '{time:'.$row->stamp.'}{spell:'.$row->enemy_spell_id.'} |'.$row->enemy_color.$row->short_title.'|r -|'.$row->color.$row->name.'|r {spell:'.$row->friendly_spell_id.'}';
}

echo implode ('<br>',$mrtArray);
    }


    public function assignments(int $id)
    {
        // http://localhost:8000/mrt/boss/assigns/6

        $results =  DB::select($this->assigmentsSQL,["id" => $id]);

return $results;
    }




    
    public function custom(int $plan_id,int $boss_id)
    {
        $results =  DB::select("
        
        SELECT t.stamp, '' AS enemy_spell_id,'' AS enemy_color, '' AS short_title , 'ff' AS color,'test' AS name, 
        s.friendly_spell_id,s.title AS friendlyName,s.filename,t.timer
    FROM custom_timers t 
     JOIN spells s ON s.id = t.spell_id
    WHERE t.boss_id  =:boss_id AND t.plan_id =:plan_id
     ORDER BY timer ASC ",
        ["boss_id" => $boss_id,'plan_id' => $plan_id]);

      $mrtArray = [];
foreach ($results as $row ) {
//  {time:03:58}{spell:420846} |cffCC0000Phase 2 Dmg|r - |cfffefefeAkumai|r {spell:246287}  
   
    $mrtArray[] = '{time:'.$row->stamp.'}|'.$row->enemy_color.$row->short_title.'|r -|'.$row->color.$row->friendlyName.'|r {spell:'.$row->friendly_spell_id.'}';
}

echo implode ('<br>',$mrtArray);
    }

}
