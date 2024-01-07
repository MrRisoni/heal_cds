<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Assignment;
use App\Models\Boss;


class MRTController extends Controller
{


    private $customPlanSQL = " 
  SELECT t.stamp, ba.enemy_spell_id,ba.enemy_color, t.boss_spell_name AS short_title , p.color,p.name, 
  s.friendly_spell_id,s.title AS friendlyName,s.filename,t.timer,t.priority
FROM custom_timers t 
JOIN spells s ON s.id = t.spell_id
JOIN specs sp ON sp.id = s.spec_id
JOIN players p ON sp.id  = p.spec_id
JOIN boss_abilities ba ON ba.id = t.boss_spell_id
WHERE t.boss_id  =:boss_id AND t.plan_id =:plan_id
ORDER BY t.timer ASC ,t.priority ASC ";


    public function plan(int $plan_id, int $boss_id)
    {

        $bossObj = Boss::find($boss_id);
        $rawAssignments = DB::select($this->customPlanSQL, ["boss_id" => $boss_id, 'plan_id' => $plan_id]);
        $assignments = [];
        foreach($rawAssignments as $raw) {
            $assignments[$raw->timer] = ['stamp' => $raw->stamp, 'enemy_spell_id' => $raw->enemy_spell_id,
            'enemy_color' => $raw->enemy_color, 'short_title' => $raw->short_title,'color' => $raw->color,
            'name' => $raw->name,'assigns' => []];
        }

        foreach($rawAssignments as $raw) {
            $tmp = new \stdClass;
            $tmp->friendlyName =$raw->friendlyName;
            $tmp->filename = $raw->filename;

            $assignments[$raw->timer]['assigns'][] =$tmp;
        }

    
       

        return view('raid_plan', [
            'bossObj' => $bossObj,
            'assignments' => $assignments]);
        

    }


    public function custom(int $plan_id, int $boss_id)
    {
        $results = DB::select(
            $this->customPlanSQL,
            ["boss_id" => $boss_id, 'plan_id' => $plan_id]
        );

        $mrtArray = [];
        foreach ($results as $row) {
            //  {time:03:58}{spell:420846} |cffCC0000Phase 2 Dmg|r - |cfffefefeAkumai|r {spell:246287}  

            $mrtArray[] = '{time:' . $row->stamp . '}{spell:' . $row->enemy_spell_id . '} |' . $row->enemy_color . $row->short_title . '|r -|' . $row->color . $row->name . '|r {spell:' . $row->friendly_spell_id . '}';
        }

        echo implode('<br>', $mrtArray);
    }

}
