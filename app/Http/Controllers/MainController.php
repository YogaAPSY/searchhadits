<?php

namespace App\Http\Controllers;

use App\Hadits;
use App\Http\Controllers\CosineSimilarityController;
use App\Http\Controllers\PreprocessingController;
use App\Http\Controllers\TfidfController;
use App\Http\Controllers\ViewController;
use Illuminate\Http\Request;

class MainController extends Controller
{
	public $keyword;
	public $praprosesDocument = [];
	public $praprosesQuery = [];
    public $cosine_result = [];
    public $jaccard_result = [];
    public $rank_cosine = [];
    public $rank_jaccard = [];
    private $views;
    private $preprocessing;
    private $tfidf;
    private $cosine;

    public function __construct(){
        $this->preprocessing = new PreprocessingController();
        $this->tfidf = new TfidfController();
        $this->views = new ViewController();
        $this->cosine = new CosineSimilarityController($this->praprosesDocument);
    }

    public function init(Request $request){
        if($request->get('search') !== NULL){
            $executionStartTime = microtime(true);
            $this->keyword = $request->get('search');

            $this->preprocessingQuery();
            $this->preprocessingDocument();
            $this->cosSimilarity();
            $this->rankingCosine();
            $this->rankingJaccard();
            
            //$rank = implode(" ",$this->rank_list);
            $keyword = $this->keyword;
            $total = count($this->rank_jaccard);
            $executionEndTime = microtime(true);
            $seconds = $executionEndTime - $executionStartTime;
            $views = Hadits::whereIn('id', $this->rank_jaccard)->paginate(15);
            $views->appends($request->only('search'));
            return view('home.result', compact('views', 'total', 'seconds', 'keyword'));

        } else {
            return 'Masukan Keyword';
        }
    }

    public function preprocessingQuery(){

	    $praprosesQuery = $this->preprocessing->init($this->keyword);

        $this->praprosesQuery = $praprosesQuery;
	}

     public function preprocessingDocument(){

        $document = Hadits::all();

        foreach ($document as $value) {
            $documents[$value->id] = $value->hadits_translate;
        }

        foreach ($documents as $key => $value) {
  
            $praprosesDocument = $this->preprocessing->init($value);

            $this->praprosesDocument[] = $praprosesDocument;

        }

    }

   public function cosSimilarity(){

        $similarity = $this->tfidf->init($this->praprosesDocument, $this->praprosesQuery, "cosine");

        $this->cosine_result = $similarity;

    }

    public function jacSimilarity(){
         $similarity = $this->tfidf->init($this->praprosesDocument, $this->praprosesQuery, "cosine");

        $this->jaccard_result = $similarity;
    }

    public function rankingCosine(){
        $doc = $this->cosine_result;
        arsort($doc);
        foreach ($doc as $key => $val) {
            if($doc[$key] > 0){
                $this->rank_cosine[] = $key+1;
            }
        }

    }

    public function rankingJaccard(){
        $doc = $this->cosine_result;
        arsort($doc);
        foreach ($doc as $key => $val) {
            if($doc[$key] > 0){
                $this->rank_jaccard[] = $key+1;
            }
        }
    }

    public function result($ranking,$executionStartTime){
            
        $this->views->results($ranking,$executionStartTime);
    }

}
