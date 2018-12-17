<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Sastrawi\Stemmer\StemmerFactory;

class PreprocessingController extends Controller
{
    /*private $x;

    public function __construct($blabla)
    {
        parent::__construct();
        $this->x = $blabla;
    }
    */

    public function init($keyword){
        $casefolding = $this->casefolding($keyword);
        $tokenizing = $this->tokenizing($casefolding);
        $stopword = $this->stopword($tokenizing);
        $stemming = $this->stemming($stopword);

        return $stemming;
    }

     public function casefolding($keyword){
        $keyword = strtolower($keyword);
        return $keyword;
    }

    public function tokenizing($words){
        $word = preg_split('/\s+/', $words);
        return $word;
    }

    public function stopword($keywords){
    $stopword = File::get('stopwords-id.txt');
    foreach ($keywords as $k => $word) {
        $token = preg_split('/\s+/', $stopword);
        foreach ($token as $l => $wordfalse) {
            
            if ($word==$wordfalse) {
                unset($keywords[$k]);
            }
        }
    }

    return $keywords;

    }

    public function stemming($keyword) {
        $stemmerFactory = new \Sastrawi\Stemmer\StemmerFactory();
        $stemmer  = $stemmerFactory->createStemmer();

        $keyword = implode(" ", $keyword);
        $output   = $stemmer->stem($keyword);
        $keywords = explode(" ", $output);

        return $keywords;
    }

}
