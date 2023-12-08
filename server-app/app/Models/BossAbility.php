<?php

 namespace App\Models;
 
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;


class BossAbility extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'boss_abilities';



    public function timers(): HasMany
    {
        return $this->hasMany(BossTimer::class,'ability_id');
    }
}