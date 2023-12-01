<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Boss;

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
}

?>