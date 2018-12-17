<?php

namespace App\Http\Controllers;

use App\Hadits;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ViewController extends Controller
{
	/*private $result = [];

	public function __construct($ranking){
		$this->result = $ranking;
	}*/

    public function index(){
    	return view('home.search');
    }

    public function results($ranking, $executionStartTime){
    	$total = count($ranking);
    	$executionEndTime = microtime(true);
        $seconds = $executionEndTime - $executionStartTime;
    	$views = Hadits::whereIn('id', $ranking)->paginate(10);

    	return view('home/result', compact('views', 'total', 'seconds'));
    }
}
