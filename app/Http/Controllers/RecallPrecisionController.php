<?php

namespace App\Http\Controllers;

use App\Hadits;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MainController;
use App\Result;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class recallPrecisionController extends Controller
{
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
    public $totalRelevanCos = 0;
    public $totalRelevanJac = 0;
    public $cosArr;
    public $jacArr;
    public $rank_cosine = [];
    public $rank_jaccard = [];
    public $total_cos;
    public $total_jac;
  	private $similarity;

  	public function __construct(){
        $this->similarity = new MainController(); 
    }

    public function resultCosine($keyword){
        $keywords = $this->similarity->preprocessingQuery($keyword);
        $this->rank_cosine = $this->similarity->init($keyword, 'cosine');
            $this->total_cos = count($this->rank_cosine);
            if(in_array("iman", $keywords)){
                $this->tpCosine("iman");

                $this->totalRelevanCosine("iman");
            } else if (in_array("zakat", $keywords)) {
                $this->tpCosine("zakat");
                $this->totalRelevanCosine("zakat");
            }else{
                $this->TP_cos = 0;
            }

            $this->fnCosine();
            $this->fpCosine();
            $this->RecallCosine();
            $this->PrecisionCosine();
    }

    public function resultJaccard($keyword){
        $keywords = $this->similarity->preprocessingQuery($keyword);
        $this->rank_jaccard = $this->similarity->init($keyword, 'jaccard');
            $this->total_jac = count($this->rank_jaccard);
            if(in_array("iman", $keywords)){
                $this->tpJaccard('iman');
                $this->totalRelevanJaccard('iman');
            } else if (in_array("zakat", $keywords)) {
                $this->tpJaccard('zakat');
                $this->totalRelevanJaccard('zakat');
            }else{
                $this->TP_jac = 0;
            }

            $this->fnJaccard();
            $this->fpJaccard();
            $this->RecallJaccard();
            $this->PrecisionJaccard();
    }

    public function getRecallAndPrecision($keyword){
    	return [
            'keyword' => $keyword,
    		'tp_cosine' => $this->TP_cos,
    		'tp_jaccard' => $this->TP_jac,
    		'fn_cosine' => $this->FN_cos,
    		'fn_jaccard' => $this->FN_jac,
    		'fp_cosine' => $this->FP_cos,
    		'fp_jaccard' => $this->FP_jac,
    		'recall_cosine' => $this->recall_cos,
    		'recall_jaccard' => $this->recall_jac,
    		'precision_cosine' => $this->precision_cos,
    		'precision_jaccard' => $this->precision_jac
    	];
    }

    public function tpCosine($index){
        $this->TP_cos = Hadits::where('index', $index)->whereIn('id', $this->rank_cosine)->count();
    }

    public function tpJaccard($index){
        $this->TP_jac = Hadits::where('index', $index)->whereIn('id', $this->rank_jaccard)->count();
    }

    public function totalRelevanCosine($index){
        $this->totalRelevanCos = 0;
        $this->totalRelevanCos = Hadits::where('index', $index)->count();
    }

    public function totalRelevanJaccard($index){
        $this->totalRelevanJac = 0;
        $this->totalRelevanJac = Hadits::where('index', $index)->count();
    }

    public function fnCosine(){
		$this->FN_cos = $this->totalRelevanCos - $this->TP_cos;
    }

    public function fnJaccard(){
        $this->FN_jac = $this->totalRelevanJac - $this->TP_jac;
    }

    public function fpCosine(){
    	$this->FP_cos = $this->total_cos - $this->TP_cos;
    }

    public function fpJaccard(){
        $this->FP_jac = $this->total_jac - $this->TP_jac;
    }

    public function RecallCosine(){

		if($this->TP_cos != 0){
			$this->recall_cos =  ($this->TP_cos / ($this->TP_cos + $this->FN_cos)) * 100;
		}else{
			$this->recall_cos =  0;
		}
    }

    public function RecallJaccard(){
        if($this->TP_jac != 0){
            $this->recall_jac =  ($this->TP_jac / ($this->TP_jac + $this->FN_jac)) * 100;
        }else{
            $this->recall_jac =  0;
        }
    }

    public function PrecisionCosine(){
 
		if($this->TP_cos != 0){
			$this->precision_cos = ($this->TP_cos / ($this->TP_cos + $this->FP_cos)) * 100;
		}else{
			$this->precision_cos =  0;
		}
    }

    public function PrecisionJaccard(){
        if($this->TP_jac != 0){
            $this->precision_jac = ($this->TP_jac / ($this->TP_jac + $this->FP_jac)) * 100;
        }else{
            $this->precision_jac =  0;
        }
    }


    public function input($keyword){

        $results = Result::where('keyword', $keyword)->get();

        if(!count($results)){
            $result = New Result();

            $result->keyword = $keyword;
            $result->tp_cosine = $this->TP_cos;
            $result->tp_jaccard = $this->TP_jac;
            $result->fp_cosine = $this->FP_cos;
            $result->fp_jaccard = $this->FP_jac;
            $result->fn_cosine = $this->FN_cos;
            $result->fn_jaccard = $this->FN_jac;
            $result->recall_cosine = $this->recall_cos;
            $result->recall_jaccard = $this->recall_jac;
            $result->precision_cosine = $this->precision_cos;
            $result->precision_jaccard = $this->precision_jac;
            $result->total_cosine = $this->totalRelevanCos;
            $result->total_jaccard = $this->totalRelevanJac;

            $result->save();
        }
    }
}
