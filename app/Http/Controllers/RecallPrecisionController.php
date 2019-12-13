<?php

namespace App\Http\Controllers;

use App\Hadits;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MainController;
use App\Result;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class recallPrecisionController extends Controller
{
    private $TP_cos;
    private $FP_cos;
    private $FN_cos;
    private $recall_cos;
    private $precision_cos;
    private $TP_jac;
    private $FP_jac;
    private $FN_jac;
    private $recall_jac;
    private $precision_jac;
    private $totalRelevanCos;
    private $totalRelevanJac;
    private $cosArr;
    private $jacArr;
    private $rank_cosine = [];
    private $rank_jaccard = [];
    private $total_cos;
    private $total_jac;
    public $time_cos;
    public $time_jac;
  	private $similarity;
    public  $result;

  	public function __construct(){
        $this->similarity = new MainController();
        $this->result = new Result;
    }

    public function resultCosine($keyword, $total, $time, $rank){
        $this->time_cos = $time;
        $this->total_cos = $total;
        $keywords = $keyword;
        $this->rank_cosine = $rank;
            $this->total_cos = count($this->rank_cosine);
             if("idul" == $keywords || "fitri"== $keywords || "idul fitri" == $keywords){
                $this->tpCosine("idul fitri");
                $this->totalRelevanCosine("idul fitri");
            }elseif ("jual"== $keywords || "beli"== $keywords || "jual beli" == $keywords) {
                $this->tpCosine("jual beli");
                $this->totalRelevanCosine("jual beli");
            }elseif("fitnah" == $keywords){
                $this->tpCosine("fitnah");
                $this->totalRelevanCosine("fitnah");
            }elseif("peperangan" == $keywords){
                $this->tpCosine("peperangan");
                $this->totalRelevanCosine("peperangan");
            }else{
                $this->TP_cos = 0;
            }

            $this->fnCosine();
            $this->fpCosine();
            $this->RecallCosine();
            $this->PrecisionCosine();
    }


    public function resultJaccard($keyword, $total, $time, $rank){
        $this->time_jac = $time;
        $this->total_jac = $total;
        $keywords = $keyword;
        $this->rank_jaccard = $rank;
            $this->total_jac = count($this->rank_jaccard);
             if("idul" == $keywords || "fitri"== $keywords || "idul fitri" == $keywords){
                $this->tpJaccard("idul fitri");
                $this->totalRelevanJaccard("idul fitri");
           }elseif ("jual"== $keywords || "beli"== $keywords || "jual beli" == $keywords) {
                $this->tpJaccard("jual beli");
                $this->totalRelevanJaccard("jual beli");
             }elseif("fitnah" == $keywords){
                $this->tpJaccard("fitnah");
                $this->totalRelevanJaccard("fitnah");
           }elseif("peperangan" == $keywords){
                $this->tpJaccard("peperangan");
                $this->totalRelevanJaccard("peperangan");
            }
            else{
                $this->TP_jac = 0;
            }

            $this->fnJaccard();
            $this->fpJaccard();
            $this->RecallJaccard();
            $this->PrecisionJaccard();
    }

/*    public function getRecallAndPrecision($keyword){
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
    		'precision_jaccard' => $this->precision_jac,
    	];
    }
*/
    private function tpCosine($index){
        $this->TP_cos = $this->similarity->hadits->where('index',$index)->whereIn('id',$this->rank_cosine)->count();
    }

    private function tpJaccard($index){
        $this->TP_jac = $this->similarity->hadits->where('index',$index)->whereIn('id',$this->rank_jaccard)->count();
    }

    private function totalRelevanCosine($index){
        $this->totalRelevanCos = $this->similarity->hadits->where('index',$index)->count();
    }

    private function totalRelevanJaccard($index){
        $this->totalRelevanJac = $this->similarity->hadits->where('index',$index)->count();
    }

    private function fnCosine(){
		$this->FN_cos = $this->totalRelevanCos - $this->TP_cos;
    }

    private function fnJaccard(){
        $this->FN_jac = $this->totalRelevanJac - $this->TP_jac;
    }

    private function fpCosine(){
    	$this->FP_cos = $this->total_cos - $this->TP_cos;
    }

    private function fpJaccard(){
        $this->FP_jac = $this->total_jac - $this->TP_jac;
    }

    private function RecallCosine(){

		if($this->TP_cos != 0){
			$this->recall_cos =  ($this->TP_cos / ($this->TP_cos + $this->FN_cos)) * 100;
		}else{
			$this->recall_cos =  0;
		}
    }

    private function RecallJaccard(){
        if($this->TP_jac != 0){
            $this->recall_jac =  ($this->TP_jac / ($this->TP_jac + $this->FN_jac)) * 100;
        }else{
            $this->recall_jac =  0;
        }
    }

    private function PrecisionCosine(){
 
		if($this->TP_cos != 0){
			$this->precision_cos = ($this->TP_cos / ($this->TP_cos + $this->FP_cos)) * 100;
		}else{
			$this->precision_cos =  0;
		}
    }

    private function PrecisionJaccard(){
        if($this->TP_jac != 0){
            $this->precision_jac = ($this->TP_jac / ($this->TP_jac + $this->FP_jac)) * 100;
        }else{
            $this->precision_jac =  0;
        }
    }


    public function input($keyword){

        $results = $this->result->where('keyword', $keyword)->get();

        if(!count($results)){
    

            $this->result->keyword = $keyword;
            $this->result->tp_cosine = $this->TP_cos;
            $this->result->tp_jaccard = $this->TP_jac;
            $this->result->fp_cosine = $this->FP_cos;
            $this->result->fp_jaccard = $this->FP_jac;
            $this->result->fn_cosine = $this->FN_cos;
            $this->result->fn_jaccard = $this->FN_jac;
            $this->result->recall_cosine = $this->recall_cos;
            $this->result->recall_jaccard = $this->recall_jac;
            $this->result->precision_cosine = $this->precision_cos;
            $this->result->precision_jaccard = $this->precision_jac;
            $this->result->total_cosine = $this->total_cos;
            $this->result->total_jaccard = $this->total_jac;
            $this->result->time_cosine = $this->time_cos;
            $this->result->time_jaccard = $this->time_jac;

            $this->result->save();
        }
    }
}
