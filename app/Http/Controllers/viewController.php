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
    private $similarity;
    
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
        $this->cosine();
        $this->jaccard();

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

        return view('home.result', compact('cos','jac','total_cos', 'total_jac', 'time_cosine','time_jaccard', 'keyword', 'halaman','FN_cos','FN_jac', 'TP_cos','TP_jac','FP_cos','FP_jac', 'recall_cos','recall_jac', 'precision_cos', 'precision_jac'));
        } else {
            return 'Masukan Keyword';
        }

    }

    public function cosine(){
        $executionStartTime = microtime(true);

        $halaman = 'cosine';
        
        $this->rank_cosine = $this->similarity->init($this->keyword, $halaman);

        $rank_cos = implode(",",$this->rank_cosine);
        $keyword = $this->keyword;
        $this->total_cos = count($this->rank_cosine);
        //print_r($this->rank_cosine);

        $this->cos = Hadits::whereIn('id', $this->rank_cosine)
        ->orderByRaw(DB::raw("FIELD('id', $rank_cos)"))->paginate(10);
        
        $executionEndTime = microtime(true);
        $this->time_cosine = $executionEndTime - $executionStartTime;

        $this->recallAndPrecision($halaman);
    }

    public function jaccard(){
        $executionStartTime = microtime(true);

        $halaman = 'jaccard';

        $this->rank_jaccard = $this->similarity->init($this->keyword, $halaman);
        $rank_jac = implode(",",$this->rank_jaccard);
        $keyword = $this->keyword;
        $this->total_jac = count($this->rank_jaccard);
        //print_r($this->rank_jaccard);

        $this->jac = Hadits::whereIn('id', $this->rank_jaccard)
        ->orderByRaw(DB::raw("FIELD('id', $rank_jac)"))->paginate(10);
     
        $executionEndTime = microtime(true);
        $this->time_jaccard = $executionEndTime - $executionStartTime;

        $this->recallAndPrecision($halaman);
    }

    public function recallAndPrecision($halaman){

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
        }
    }
    

}
