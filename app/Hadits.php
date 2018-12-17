<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Hadits extends Model
{
    protected $table = "hadits";

    protected $fillable = [ 'no_hadits','index','hadits_translate'];
}
