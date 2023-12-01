<?php

 namespace App\Models;
 
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Boss extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'bosses';


    public function abilities(): HasMany
    {
        return $this->hasMany(BossAbility::class);
    }
}