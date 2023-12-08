<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Assignment;


class MRTController extends Controller
{
   
    private $assigmentsSQL = "
    SELECT t.stamp,ba.enemy_spell_id,ba.enemy_color, ba.short_title , p.color,p.name, s.friendly_spell_id,s.title AS friendlyName
FROM boss_timing t 
JOIN boss_abilities ba ON ba.id = t.ability_id
JOIN assignments a ON a.timer_id = t.id
JOIN players p ON p.id = a.player_id
JOIN spells s ON s.id = a.heal_spell_id
WHERE ba.boss_id  =:id
ORDER BY t.order_id ASC ";


    public function export(int $id)
    {
        $results =  DB::select($this->assigmentsSQL,["id" => $id]);

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
}
