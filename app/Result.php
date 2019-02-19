<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Result extends Model
{
     protected $table = "result";

    protected $fillable = [ 'keyword',
    						'to_cosine',
    						'tp_jaccard',
    						'fp_cosine',
    						'fp_jaccard',
    						'fn_cosine',
    						'fn_jaccard',
    						'recall_cosine',
    						'recall_jaccard',
    						'precision_cosine',
    						'precision_jaccard',
    						'total_cosine',
    						'total_jaccard'];
}
