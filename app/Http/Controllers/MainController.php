<?php

namespace App\Http\Controllers;

use App\Hadits;
use App\Http\Controllers\CosineSimilarityController;
use App\Http\Controllers\PreprocessingController;
use App\Http\Controllers\TfidfController;
use App\Http\Controllers\ViewController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MainController extends Controller
{
	public $praprosesDocument = [];
	public $praprosesQuery = [];
    public $cosine_result = [];
    public $jaccard_result = [];
    public $rank_cosine = [];
    public $rank_jaccard = [];
    private $views;
    private $preprocessing;
    private $tfidf;

    public function __construct(){
        $this->preprocessing = new PreprocessingController();
        $this->tfidf = new TfidfController();
    }

    public function init($keyword, $similarity){

        $this->preprocessingQuery($keyword);
        $this->preprocessingDocument();
        //print_r($this->cosine_result);

        if($similarity == 'cosine'){
            $this->cosSimilarity();
            $this->rankingCosine();

            return $this->rank_cosine;

        }elseif($similarity == 'jaccard') {
            $this->jacSimilarity();
            $this->rankingJaccard();
            //print_r($this->jaccard_result);
            return $this->rank_jaccard;
        }
    }


    public function preprocessingQuery($keyword){

	    $praprosesQuery = $this->preprocessing->init($keyword);

        $this->praprosesQuery = $praprosesQuery;

        return $this->praprosesQuery;
	}

     public function preprocessingDocument(){

        $document = Hadits::all();
        $documents = [];
        foreach ($document as $value) {
            $documents[$value->id] = $value->hadits_translate;
        }

        $this->praprosesDocument = [];
        foreach ($documents as $key => $value) {
  
            $praprosesDocument = $this->preprocessing->init($value);

            $this->praprosesDocument []= $praprosesDocument;
        }

    }

   public function cosSimilarity(){

        $similarity = $this->tfidf->init($this->praprosesDocument, $this->praprosesQuery, "cosine");

        $this->cosine_result = $similarity;

        //print_r($this->cosine_result);

    }

    public function jacSimilarity(){
        $similarity = $this->tfidf->init($this->praprosesDocument, $this->praprosesQuery, "jaccard");

        $this->jaccard_result = $similarity;

        //print_r($this->jaccard_result);
    }

    public function rankingCosine(){
        $doc = $this->cosine_result;
        arsort($doc);
        foreach ($doc as $keys => $val) {
            if($doc[$keys] > 0.5){
                $this->rank_cosine[] = $keys+1;
            }
        }

    }

    public function rankingJaccard(){
        $doc = $this->jaccard_result;
        arsort($doc);
        foreach ($doc as $key => $val) {
            if($doc[$key] > 0.5){
                $this->rank_jaccard[] = $key+1;
            }
        }
        //print_r($this->rank_jaccard);
    }

}
