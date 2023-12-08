<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Boss;
use App\Models\BossAbility;
use App\Models\BossTimer;

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

        /*
        SELECT ta.stamp,ba.full_name
FROM boss_timing ta
JOIN boss_abilities ba ON ba.id = ta.ability_id
WHERE ba.boss_id =6
ORDER BY ta.order_id ASC
*/
            return  BossTimer::with('ability')->get()->toArray();
    }
}

?>