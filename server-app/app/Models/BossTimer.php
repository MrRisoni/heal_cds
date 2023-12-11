<?php

 namespace App\Models;
 
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BossTimer extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'boss_timing';

    public $timestamps = false;



    
    public function timers(): HasMany
    {
        return $this->hasMany(BossTimer::class,'ability_id');
    }

    
    public function ability(): BelongsTo
    {
        return $this->belongsTo(BossAbility::class);
    }

}