<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Similarity extends Model
{
    protected $table = 'similarity';

    protected $fillable = ['keyword',
    						'cosine_similarity',
    						'id_document'
    					];
}
