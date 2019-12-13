<?php

namespace App\Http\Controllers;

use App\Hadits;
use App\Http\Controllers\Controller;
use App\Http\Controllers\CosineSimilarityController;
use App\Http\Controllers\JaccardSimilarityController;
use App\Http\Controllers\PreprocessingController;
use Illuminate\Http\Request;
use Phpml\FeatureExtraction\TfIdfTransformer;
use Phpml\FeatureExtraction\TokenCountVectorizer;
use Phpml\Tokenization\WhitespaceTokenizer;

class TfidfController extends Controller
{
    private $docTf;
    private $tfIdfWeight = [];
    private $cosSimiliarity = [];
    private $jacSimiliarity = [];
    private $tfQuery;
    private $queryWeight;
    private $df;
    private $idf;
    private $indexterm;
    private $tfidf = [];
    private $queryVector=[];
    private $dotProduct=[];
    private $docVector=[];
    private $similarity;



    public function init($documents,$terms, $similarity){
        $this->build_index($terms, $documents);
        $this->df();
        $this->tfIdfCalculator($this->docTf);
        $this->tfQueryCalculator($terms);
        //$this->documentWeight($documents,$terms);
        $this->queryWeightCalculator($terms);
        $this->tfidf = $this->Data();
        $this->documentVector($this->tfidf);
        $this->queryVector($this->tfidf);
        $this->dotProductCalc($this->tfidf);
        //print_r($this->queryVector);

        if($similarity == 'cosine'){
            
            $this->cosineSimiliarity($documents);
            return $this->cosSimiliarity;
        } elseif($similarity == 'jaccard'){
         
            $this->jaccardSimiliarity($documents);
            return $this->jacSimiliarity;
        
        }
    }
    private function build_index($terms, $documents){
    
        $vectorizer = new TokenCountVectorizer(new WhitespaceTokenizer());

        $vectorizer->fit($documents);

        $vectorizer->transform($documents);

        $this->tfdocuments($documents);

        $this->indexterm = $vectorizer->getVocabulary();
        //print_r($this->indexterm);
    }

    private function tfdocuments($documents){
            $this->docTf = $documents;
    }

    private function df(){
        $index          = $this->indexterm;
        $tfdocument     = $this->tfIdfWeight;

        for ($i=0; $i < count($index); $i++) { 
            $temp = 0;
            for ($j=0; $j < count($tfdocument); $j++) { 
                if($tfdocument[$j][$i] > 0){
                    $temp += 1;
                } 
            }
            $df[$i] = $temp;
        }
        $this->df = $df;
    }

     private function Data(){

        foreach ($this->indexterm as $index => $indexvalue) {
            $this->tfidf['tfidfquery']             = $this->queryWeight;
            $this->tfidf['tfidfdocument']          = $this->tfIdfWeight;
        }
        return $this->tfidf;
    }

    private function tfIdfCalculator($arr){
        $val = $arr;
        $transformer = new TfIdfTransformer($val);
        $transformer->transform($val);
        $this->tfIdfWeight    = $val;
        $this->idf            = $transformer->get_idf();
        //print_r($this->tfIdfWeight);
        //var_dump($this->tfIdfWeight);
    }


    private function cosineSimiliarity($documents){

        $cosine = new CosineSimilarityController();
        $this->cosSimiliarity = $cosine->cos($documents, $this->docVector, $this->queryVector, $this->dotProduct);
        
    }
    private function jaccardSimiliarity($documents){

        $jaccard = new JaccardSimilarityController();
         $this->jacSimiliarity = $jaccard->jac($documents, $this->docVector, $this->queryVector, $this->dotProduct);
        
    }

    private function tfQueryCalculator($query){
        $tfquery = array_fill(0, count($this->indexterm), 0);
        
        foreach ($query as $query=>$q) {
            foreach ($this->indexterm as $index => $value) {
                if ($value == $q) {
                    $tfquery[$index]+=1;
                }
            }
            
        }
        $this->tfQuery = $tfquery;
        // print_r($this->tfQuery);

    }
    private function queryWeightCalculator(){

        $tfquery    = $this->tfQuery;
        $idf        = $this->idf;
        $hasil = [];
        foreach ($tfquery as $key => $value) {
            $hasil[] = $value*$idf[$key];
        } 
        $this->queryWeight = $hasil;
    
        //print_r($this->queryWeight);

    }

    private function dotProductCalc($tfidf){
        $eachDot = 0;
        $tfidfd = $tfidf['tfidfdocument'];
        $tfidfq = $tfidf['tfidfquery'];

        for($i = 0; $i < count($tfidfd); $i ++ ){
            for($j = 0; $j < count($tfidfq); $j++){
                $eachDot += $tfidfd[$i][$j] * $tfidfq[$j];
            }
            $this->dotProduct[$i] = $eachDot;
               $eachDot = 0;
        }
        //print_r($tfidfq);
        //print_r($tfidfd);
       //print_r($this->dotProduct);

    }

    private function documentVector($tfidf){
        $eachDoc = 0;
        $tfidfd = $tfidf['tfidfdocument'];
        $tfidfq = $tfidf['tfidfquery'];

        for($i = 0; $i < count($tfidfd); $i ++ ){
            for($j = 0; $j < count($tfidfq); $j++){
                $eachDoc += $tfidfd[$i][$j] * $tfidfd[$i][$j];
            }
            $this->docVector[$i] = $eachDoc;
               $eachDoc = 0;
        }
        //print_r($tfidfq);
        //print_r($this->docVector);
    }

    private function queryVector($tfidf){
        $eachQuery = 0;
        $tfidfd = $tfidf['tfidfdocument'];
        $tfidfq = $tfidf['tfidfquery'];
         for($i = 0; $i < count($tfidfd); $i ++ ){
            for($j = 0; $j < count($tfidfq); $j++){
                $eachQuery += $tfidfq[$j] * $tfidfq[$j];
            }
            $this->queryVector[$i] = $eachQuery;
               $eachQuery = 0;
        }
        //print_r($this->queryVector);

    }
}