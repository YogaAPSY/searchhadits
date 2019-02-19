<?php

namespace App\Http\Controllers;

use App\Hadits;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MainController;
use App\Http\Controllers\TfidfController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use session;

class ViewController extends Controller
{
 
    public $keyword = [];
    public $total_cos;
    public $total_jac;
    public $rank_cosine = [];
    public $rank_jaccard = [];
    public $cos;
    public $jac;
    public $time_cosine;
    public $time_jaccard;
    public $TP_cos;
    public $FP_cos;
    public $FN_cos;
    public $recall_cos;
    public $precision_cos;
    public $TP_jac;
    public $FP_jac;
    public $FN_jac;
    public $recall_jac;
    public $precision_jac;
    public $totalRelevanCos;
    public $totalRelevanJac;
    public $cosArr;
    public $jacArr;
    private $similarity;
    private $requestObj;
    
    public function __construct(){
        $this->similarity = new MainController();
    }

    public function index(){
    	return view('home.search');
    }

    public function result(Request $request){
        if($request->get('search') !== NULL){
        $this->keyword = $request->get('search');

        //session(['keyword' => $this->keyword]);
        $this->cosine($request);
        $this->jaccard($request);

        $cos = $this->cos;
        $jac = $this->jac;
        $total_cos = $this->total_cos;
        $total_jac = $this->total_jac;
        $time_cosine = $this->time_cosine;
        $time_jaccard = $this->time_jaccard;
        $keyword = $this->keyword;
        $FN_cos = $this->FN_cos;
        $FN_jac = $this->FN_jac;
        $TP_cos = $this->TP_cos;
        $TP_jac = $this->TP_jac;
        $FP_cos = $this->FP_cos;
        $FP_jac = $this->FP_jac;
        $recall_cos = $this->recall_cos;
        $recall_jac = $this->recall_jac;
        $precision_cos = $this->precision_cos;
        $precision_jac = $this->precision_jac;

        $this->cos->appends($request->only('search'));
        $this->jac->appends($request->only('search'));

        $this->cos = $this->data;
        $cosArr = $this->cos;

        $this->jac = $this->data;
        $jacArr = $this->jac;

        return view('home.result', compact('cos', 'cosArr', 'jac','jacArr','total_cos', 'total_jac', 'time_cosine','time_jaccard', 'keyword', 'halaman','FN_cos','FN_jac', 'TP_cos','TP_jac','FP_cos','FP_jac', 'recall_cos','recall_jac', 'precision_cos', 'precision_jac'));
        } else {
            return 'Masukan Keyword';
        }

    }

    public function cosine(Request $request){
        $executionStartTime = microtime(true);

        $halaman = 'cosine';
        $perPage = 10;
        $page = 1;
        if (isset($_GET['page1']))
        {
            $page = $_GET['page1'];
        }
        
        $this->rank_cosine = $this->similarity->init($this->keyword, $halaman);
        $rank_cosine_paginate = [];
        $i = $page == 1 ? 0 : ($page * $perPage) - $perPage;
        $j = $i;
        for (; $i < $j + $perPage; $i++)
        {
            if (!isset($this->rank_cosine[$i]))
            {
                break;
            }
            $rank_cosine_paginate []= $this->rank_cosine[$i];
        }

        $rank_cos = implode(",",$this->rank_cosine);
        $keyword = $this->keyword;
        $this->total_cos = count($this->rank_cosine);
        //print_r($this->rank_cosine);

        $this->cos = Hadits::whereIn('id', $this->rank_cosine)
        ->orderByRaw(DB::raw("FIELD('id', $rank_cos)"))->paginate($perPage, ['*'], 'page1');
        $this->cosArr = $this->cos->toArray();
        $this->data = $this->cosArr['data'];
        array_multisort($rank_cosine_paginate, SORT_DESC, $this->data);
        //$this->cosArr = $this->cos->toArray();
        //array_multisort($this->rank_cosine, SORT_DESC, $this->cosArr);

        $executionEndTime = microtime(true);
        $this->time_cosine = $executionEndTime - $executionStartTime;

        $this->recallAndPrecision($request, $halaman);
    }

    public function jaccard(Request $request){
        $executionStartTime = microtime(true);

        $halaman = 'jaccard';
        $perPage = 10;
        $page = 1;
        if (isset($_GET['page2']))
        {
            $page = $_GET['page2'];
        }
        $this->rank_jaccard = $this->similarity->init($this->keyword, $halaman);
        $rank_jaccard_paginate = [];
        $i = $page == 1 ? 0 : ($page * $perPage) - $perPage;
        $j = $i;
        for (; $i < $j + $perPage; $i++)
        {
            if (!isset($this->rank_jaccard[$i]))
            {
                break;
            }
            $rank_jaccard_paginate []= $this->rank_jaccard[$i];
        }

        $rank_jac = implode(",",$this->rank_jaccard);
        $keyword = $this->keyword;
        $this->total_jac = count($this->rank_jaccard);
        //print_r($this->rank_jaccard);

        $this->jac = Hadits::whereIn('id', $this->rank_jaccard)
        ->orderByRaw(DB::raw("FIELD('id', $rank_jac)"))->paginate(10, ['*'], 'page2');
        
        $this->jacArr = $this->jac->toArray();
        $this->data = $this->jacArr['data'];
        array_multisort($rank_jaccard_paginate, SORT_DESC, $this->data);

        $executionEndTime = microtime(true);
        $this->time_jaccard = $executionEndTime - $executionStartTime;

        $this->recallAndPrecision($request, $halaman);
    }

    public function recallAndPrecision(Request $request, $halaman){

        $keyword = $this->similarity->preprocessingQuery($this->keyword);
        //print_r($keyword);
        if($halaman == 'cosine'){
            if(in_array("iman", $keyword)){
                $this->TP_cos = Hadits::where('index', 'iman')->whereIn('id', $this->rank_cosine)->count();
                $this->totalRelevanCos = Hadits::where('index', 'iman')->count();
            } else if (in_array("zakat", $keyword)) {
                $this->TP_cos = Hadits::where('index', 'zakat')->whereIn('id', $this->rank_cosine)->count();
                $this->totalRelevanCos = Hadits::where('index', 'zakat')->count();
            }
            if($this->TP_cos != 0){
                $this->FN_cos = $this->totalRelevanCos - $this->TP_cos;
                $this->FP_cos = $this->total_cos - $this->TP_cos;
                $this->recall_cos =  ($this->TP_cos / ($this->TP_cos + $this->FN_cos)) * 100;
                $this->precision_cos = ($this->TP_cos / ($this->TP_cos + $this->FP_cos)) * 100;
            } else {
                $this->FN_cos = $this->totalRelevanCos - $this->TP_cos;
                $this->FP_cos = $this->total_cos - $this->TP_cos;
                $this->recall_cos =  0;
                $this->precision_cos = 0;
            }
            $request->session()->put('result_cosine', $this);
        } 
        elseif ($halaman == 'jaccard') {
            if(in_array("iman", $keyword)){
                $this->TP_jac = Hadits::where('index', 'iman')->whereIn('id', $this->rank_jaccard)->count();
                $this->totalRelevanJac = Hadits::where('index', 'iman')->count();
            } elseif (in_array("zakat", $keyword)) {
                $this->TP_jac = Hadits::where('index', 'zakat')->whereIn('id', $this->rank_jaccard)->count();
                $this->totalRelevanJac = Hadits::where('index', 'zakat')->count();
            }
            if ($this->TP_jac != 0) {
                $this->FN_jac = $this->totalRelevanJac - $this->TP_jac;
                $this->FP_jac = $this->total_jac - $this->TP_jac;
                $this->recall_jac =  ($this->TP_jac / ($this->TP_jac + $this->FN_jac)) * 100;
                $this->precision_jac = ($this->TP_jac / ($this->TP_jac + $this->FP_jac)) * 100;
            } else {
                $this->FN_jac = $this->totalRelevanJac - $this->TP_jac;
                $this->FP_jac = $this->total_jac - $this->TP_jac;
                $this->recall_jac =  0;
                $this->precision_jac = 0;
            }
            $request->session()->put('result_jaccard', $this);
        }
    }
    
}
