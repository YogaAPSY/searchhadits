<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Jaccard extends Model
{
    protected $table = 'jaccard';

    protected $fillable = ['keyword',
    						'jaccard_similarity',
    						'id_document'
    					];
}
