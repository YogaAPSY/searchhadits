<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DataEntityController extends Controller
{
    private $jacSimilarity = [];
    private $cosSimiliarity = [];

    public function setCosSimilarity($value,$key){
    	$this->cosSimiliarity[$key] = $value;
    }

    public function getCosSimilarity(){
    	return $this->cosSimiliarity;
    }

    public function setJacSimilarity($value, $key){
    	$this->jacSimiliarity[$key] = $value;
    }

    public function getJacSimilarity(){
    	return $this->jacSimiliarity;
    }

}
