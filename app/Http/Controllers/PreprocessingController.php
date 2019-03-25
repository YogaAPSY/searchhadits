<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Sastrawi\Stemmer\StemmerFactory;

class PreprocessingController extends Controller
{

    public function init($text, $tes){
        $casefolding = $this->casefolding($text);
        $tokenizing = $this->tokenizing($casefolding);
        $stopword = $this->stopword($tokenizing);
  
        if($tes == 'text'){
            $stemming = $this->stemming($stopword);
        }elseif($tes = 'document'){
            $stemming = $this->stemmingD($stopword);
        }


        return $stemming;
    }

     private function casefolding($texts){
        $text = strtolower($texts);
        return $text;
    }

    private function tokenizing($texts){
        $text = preg_split('/\s+/', $texts);
        return $text;
    }

    private function stopword($texts){
    $stopword = File::get('stopwords-id.txt');
    foreach ($texts as $k => $text) {
        $token = preg_split('/\s+/', $stopword);
        foreach ($token as $l => $wordfalse) {
            
            if ($text==$wordfalse) {
                unset($texts[$k]);
            }
        }
    }

    return $texts;

    }

    private function stemming($keyword) {
        $stemmerFactory = new \Sastrawi\Stemmer\StemmerFactory();
        $stemmer  = $stemmerFactory->createStemmer();

        $keyword = implode(" ", $keyword);
        $output   = $stemmer->stem($keyword);
        $keywords = explode(" ", $output);

        return $keywords;
    }

    private function stemmingD($keyword) {
        $stemmerFactory = new \Sastrawi\Stemmer\StemmerFactory();
        $stemmer  = $stemmerFactory->createStemmer();

        $keyword = implode(" ", $keyword);
        $output   = $stemmer->stem($keyword);

        return $output;
    }

}
