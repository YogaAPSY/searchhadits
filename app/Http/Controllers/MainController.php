<?php

namespace App\Http\Controllers;

use App\Hadits;
use Illuminate\Http\Request;

class MainController extends Controller
{
	public $keyword;
	public $documents = [];
	public $praprosesDocument = [];
	public $praprosesQuery = [];
    public $docCount = [];
    public $cosine = [];
    public $ranking = [];
    private $views;
    private $preprocessing;
    private $tfidf;

    public function __construct(){
        $this->preprocessing = New PreprocessingController();
        $this->tfidf = New TfidfController();
        $this->views = New ViewController();
    }

    public function init(Request $request){
        if($request->get('search') !== NULL){
            $executionStartTime = microtime(true);
            $this->keyword = $request->get('search');

            $this->preprocessingQuery();
            $this->preprocessingDocument();
            $this->tfidf();
            $this->ranking();
            $this->result($executionStartTime);

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

   public function tfidf(){

        $tfidfhasil = $this->tfidf->inits($this->praprosesDocument, $this->praprosesQuery);

        $this->cosine = $tfidfhasil;
    }

    public function ranking(){
        $doc = $this->cosine;
        arsort($doc);
        foreach ($doc as $key => $val) {
            if($doc[$key] > 0){
                $this->ranking[] = $key+1;
            }
        }
    }

    public function result($executionStartTime){
            
        $this->views->results($this->ranking , $executionStartTime);
    }

}
