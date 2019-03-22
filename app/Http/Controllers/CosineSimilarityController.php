<?php

namespace App\Http\Controllers;

use App\Http\Controllers\TfidfController;
use Illuminate\Http\Request;

class CosineSimilarityController extends Controller
{

    private $cosSimilarity = [];
    
    public function cos($documents, $docVector, $vectorQuery, $dotProduct){
   		foreach ($documents as $key => $doc) {
            if ($docVector[$key] == 0)
                $this->cosSimilarity[$key] = 0;
            else{
                $this->cosSimilarity[$key] = $dotProduct[$key] / sqrt( $docVector[$key] * $vectorQuery );
            }
        }

        return $this->cosSimilarity;

    }

    /*public function setcosSimiliarity($cosine,$key){
        $this->cosSimiliarity[$key] = $cosine;
    }

    public function getcosSimilarity(){
        return $this->cosSimiliarity;
    }*/
    


}
