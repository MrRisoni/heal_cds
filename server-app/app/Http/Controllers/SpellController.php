<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Spell;

class SpellController extends Controller
{
   
    public function spells()
    {
        return  Spell::all();

    }

   
}

?>