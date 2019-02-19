<?php

namespace App\Http\Controllers;


use App\Http\Controllers\Controller;
use App\Http\Controllers\CosineSimilarityController;
use App\Http\Controllers\JaccardSimilarityController;
use Illuminate\Http\Request;

class TfidfController extends Controller
{
    public $docTf = [];
    public $tfIdfWeight = [];
    public $docVector = [];
    public $dotProduct = [];
    public $cosSimiliarity = [];
    public $jacSimiliarity = [];
    public $tfQuery;
    public $vectorQuery;
    public $queryWeight = [];
    public $docIdf = [];
    public $df = [];



    public function init($documents,$terms, $similarity){

        $this->tfIdfCalculator($documents,$terms);
        $this->tfQueryCalculator($terms);
        $this->documentWeight($documents,$terms);
        $this->queryWeightCalculator($terms);
        $this->documentVector($documents,$terms);
        $this->queryVectorCalculator($terms);
        $this->dotProductCalc($documents,$terms);
      
        if($similarity == 'cosine'){
            
            $this->cosineSimiliarity($documents);

            return $this->cosSimiliarity;
        } elseif($similarity == 'jaccard'){
         
            $this->jaccardSimiliarity($documents);

            return $this->jacSimiliarity;
        
        }
    }


    public function tfIdfCalculator($documents,$terms){
        $df = [];
        $docCount = 0;
        foreach ($documents as $key => $doc) {

            foreach ($terms as $term) {
                if(!isset($df[$term]))
                    $df[$term] = 0;
                $f = $this->compare($doc,$term);
                $this->docTf[$key][$term] = $f;

                if($f > 0)
                    $df[$term] += 1;

            }
            $docCount += 1;
        }
        foreach ($terms as $term) {
            if($df[$term] == 0){
                $this->docIdf[$term] = 0;
            }
            else{
                $this->docIdf[$term] = log10($docCount/$df[$term]);
            }

        }
             
    }

    public function compare($text,$_term){
        $term = $_term;
        $words = $text;

        $_f = 0;
        foreach ($words as $word) {
            if($word == $term)
            $_f += 1;   
        }
        return $_f;
    }

    public function documentWeight($documents,$terms){

        foreach ($documents as $key => $doc) {

            foreach ($terms as $term) {
                $this->tfIdfWeight[$key][$term] =
                $this->docTf[$key][$term] *
                $this->docIdf[$term];

            }
        }

    }

    public function documentVector($documents,$terms){
        $squareWeight = 0;

        foreach ($documents as $key => $doc) {

            foreach ($terms as $term) {
                $squareWeight += $this->tfIdfWeight[$key][$term] *
                $this->tfIdfWeight[$key][$term];
            }

            $this->docVector[$key] = $squareWeight;
            $squareWeight = 0;

           //print_r($this->docVector[$key] . "<br>");

        }

    }

    public function dotProductCalc($documents,$terms){
        $eachDot = 0;

        foreach ($documents as $key => $doc) {

            foreach ($terms as $term) {
                $eachDot += $this->tfIdfWeight[$key][$term] *
                $this->queryWeight[$term];
            }

            $this->dotProduct[$key] = $eachDot;
            $eachDot = 0;

        }

    }

    public function cosineSimiliarity($documents){

        $cosine = new CosineSimilarityController();

        $this->cosSimiliarity = $cosine->cos($documents, $this->docVector, $this->vectorQuery, $this->dotProduct);
        
        return $this->cosSimiliarity;


    }

    public function jaccardSimiliarity($documents){
        $jaccard = new JaccardSimilarityController();

        $this->jacSimiliarity = $jaccard->jac($documents, $this->docVector, $this->vectorQuery, $this->dotProduct);

        return $this->jacSimiliarity;
    }

    public function tfQueryCalculator($terms){
        $text = $terms;
        
        foreach ($terms as $term) {
            $this->tfQuery[$term] = $this->compare($text,$term);
        }
    }

    public function queryWeightCalculator($terms){

        foreach ($terms as $term) {
            $this->queryWeight[$term] = $this->tfQuery[$term] * $this->docIdf[$term];
        }
    }

    function queryVectorCalculator($terms){
        $squareWeight = 0;

        foreach ($terms as $term) {
            $squareWeight += $this->queryWeight[$term] * $this->queryWeight[$term];
            $this->vectorQuery = $squareWeight;
        }
    }

}
