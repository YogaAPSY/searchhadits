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
    public $docTf;
    public $tfIdfWeight = [];
    public $cosSimiliarity = [];
    public $jacSimiliarity = [];
    public $tfQuery;
    public $queryWeight;
    public $df;
    public $idf;
    public $indexterm;
    public $tfquery_view;
    public $tfidf = [];
    public $queryVector=[];
    public $dotProduct=[];
    public $docVector=[];

    public function init($documents,$terms, $similarity){
        $this->build_index($terms);
        $this->df();
        $this->tfIdfCalculator($this->docTf);
        $this->tfQueryCalculator($terms);
        //$this->documentWeight($documents,$terms);
        $this->queryWeightCalculator($terms);
        $this->tfidf = $this->TFIDFdata();
        $this->documentVector($this->tfidf);
        $this->queryVector($this->tfidf);
        $this->dotProductCalc($this->tfidf);
        //print_r($this->tfIdfWeight);
        print_r($this->queryWeight);
        if($similarity == 'cosine'){
            
            $this->cosineSimiliarity($documents);
            return $this->cosSimiliarity;
        } elseif($similarity == 'jaccard'){
         
            $this->jaccardSimiliarity($documents);
            return $this->jacSimiliarity;
        
        }
    }
    private function build_index($terms){
        $document = Hadits::all();
        $preprocessing = new PreprocessingController();
        $documents = [];
        foreach ($document as $key => $value) {
            $documents[$value->id] = $value->hadits_translate;
        }

        $praprosesDocument = [];
        foreach ($documents as $key => $value) {
  
            $praprosesDocument[] = $preprocessing->init($value, 'document');
        }
       /* $term = [];
        foreach ($terms as $value) {
            $term = $value;
        }
        array_push($praprosesDocument, $term);*/
        //print_r($praprosesDocument);
        $vectorizer = new TokenCountVectorizer(new WhitespaceTokenizer());

        $vectorizer->fit($praprosesDocument);

        $vectorizer->transform($praprosesDocument);

         $this->tfdocuments($praprosesDocument);

        $this->indexterm = $vectorizer->getVocabulary();

        //print_r($this->indexterm);
    }

    private function tfdocuments($arr){
            $this->docTf = $arr;
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

     private function TFIDFdata(){

        foreach ($this->indexterm as $index => $indexvalue) {
            $this->tfidf[$index]['index']          = $indexvalue;
            $this->tfidf[$index]['tfquery']        = $this->tfQuery[$index];
            $this->tfidf[$index]['df']             = $this->df[$index];
            $this->tfidf[$index]['idf']            = $this->idf[$index];
            $this->tfidf[$index]['tfidfquery']     = $this->queryWeight[$index];
            $this->tfidf['tfidfquery']             = $this->queryWeight;
            $this->tfidf['tfidfdocument']          = $this->tfIdfWeight;
            $this->tfidf['tfview']                 = $this->tfquery_view;
            foreach ($this->docTf as $doc => $value) {
                $this->tfidf[$index]['tfdoc'][$doc] = $this->docTf[$doc][$index];
            }
            foreach ($this->docTf as $doc => $value) {
                $this->tfidf[$index]['tfidfdoc'][$doc] = $this->docTf[$doc][$index];
            }
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
        $tfview = [];
        //var_dump($query);
        foreach ($query as $query=>$valq) {
            foreach ($this->indexterm as $index => $value) {
                if ($value == $valq) {
                    $tfquery[$index]+=1;
                    $tfview[] = $index;
                }
            }
            
        }
        $this->tfQuery = $tfquery;
        $this->tfquery_view = $tfview;
        //var_dump($this->tfQuery);

    }
    private function queryWeightCalculator(){

        $tfquery    = $this->tfQuery;
        $idf        = $this->idf;
        $hasil = [];
        foreach ($tfquery as $key => $value) {
            $hasil[] = $value*$idf[$key];
        } 
        $this->queryWeight = $hasil;
    
       // var_dump($this->queryWeight);

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
/*        foreach ($tfidfd as $key => $d) {
            foreach ($tfidfq as $keys => $q) {
                $eachDot += $d[$key][$keys] * $tfidfq[$keys];
            }
               $this->dotProduct[$key] = $eachDot;
               $eachDot = 0;
        }*/
       // print_r($this->dotProduct);

    }

    private function documentVector($tfidf){
        $eachDoc = 0;
        $tfidfd = $tfidf['tfidfdocument'];
        $tfidfq = $tfidf['tfidfquery'];
        //var_dump($tfidfq);

        for($i = 0; $i < count($tfidfd); $i ++ ){
            for($j = 0; $j < count($tfidfq); $j++){
                $eachDoc += $tfidfd[$i][$j] * $tfidfd[$i][$j];
            }
            $this->docVector[$i] = $eachDoc;
               $eachDoc = 0;
        }

        //print_r($this->docVector);
        /*foreach ($tfidfd as $key => $d) {
            foreach ($tfidfq as $keys => $q) {
                $eachDoc += $d[$key][$keys] * $d[$key][$keys];
            }
              $this->docVector[$key] = $eachDoc;
        }*/
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

        /*foreach ($tfidfd as $key => $d) {
            foreach ($tfidfq as $keys => $q) {
                $eachQuery += $tfidfq[$key] * $tfidfq[$key];
            }
             $this->queryVector[$key] = $eachQuery;
        }*/
    }
}