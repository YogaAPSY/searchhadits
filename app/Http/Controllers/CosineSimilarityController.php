<?php

namespace App\Http\Controllers;

use App\Http\Controllers\TfidfController;
use Illuminate\Http\Request;

class CosineSimilarityController extends Controller
{
    public $cosSimiliarity = [];

    //public function __construct(array $documents){
    	//$this->tfidf = new TfidfController();

    	//$this->documents[] = $documents;
   // }

    public function cos($documents, $docVector, $vectorQuery, $dotProduct){
   		foreach ($documents as $key => $doc) {
            if ($docVector[$key] == 0)
                $this->tfidf->cosSimiliarity[$key] = 0;
            else{
                $this->cosSimiliarity[$key] =
                $dotProduct[$key] / sqrt( $docVector[$key] * $vectorQuery );
            }
        }
            return $this->cosSimiliarity;
    }


}
