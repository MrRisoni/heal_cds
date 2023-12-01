<?php

 namespace App\Models;
 
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Assignment extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'assignments';


    public function spell_queue()
    {
        return $this->hasOne(BossTimer::class);
    }
}