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
    public $totalRelevanCos;
    public $totalRelevanJac;
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
     public function setRecallAndPrecision($keyword, $halaman){
   		$keywords = $this->similarity->preprocessingQuery($keyword);
     	
     	if($halaman == 'cosine'){
     		$this->rank_cosine = $this->similarity->init($keyword, 'cosine');
     		$this->total_cos = count($this->rank_cosine);
     		if(in_array("iman", $keywords)){
               	$this->TP($halaman, 'iman');
                $this->totalRelevan($halaman, 'iman');
            } else if (in_array("zakat", $keywords)) {
                $this->TP($halaman, 'zakat');
                $this->totalRelevan($halaman,'zakat');
            }

		    $this->FN($halaman);
		    $this->FP($halaman);
		    $this->Recall($halaman);
		    $this->Precision($halaman);
		 
     	}elseif ($halaman == 'jaccard') {
     		$this->rank_jaccard = $this->similarity->init($keyword, 'jaccard');
     		$this->total_jac = count($this->rank_jaccard);
     		if(in_array("iman", $keywords)){
               	$this->TP($halaman, 'iman');
                $this->totalRelevan($halaman, 'iman');
            } else if (in_array("zakat", $keywords)) {
                $this->TP($halaman, 'zakat');
                $this->totalRelevan($halaman,'zakat');
            }

		    $this->FN($halaman);
		    $this->FP($halaman);
		    $this->Recall($halaman);
		    $this->Precision($halaman);
     	}

     	$this->input($keyword);

    }

    public function getRecallAndPrecision(){
    	return [
    		$this->TP_cos,
    		$this->TP_jac,
    		$this->FN_cos,
    		$this->FN_jac,
    		$this->FP_cos,
    		$this->FP_jac,
    		$this->recall_cos,
    		$this->recall_jac,
    		$this->precision_cos,
    		$this->precision_jac,
    	];
    }

    public function TP($halaman, $index){
    	if($halaman == 'cosine'){
    	 	$this->TP_cos = Hadits::where('index', '$index')->whereIn('id', $this->rank_cosine)->count();
    	}elseif($halaman == 'jaccard'){
    		$this->TP_jac = Hadits::where('index', '$index')->whereIn('id', $this->rank_cosine)->count();
    	}
    }

    public function totalRelevan($halaman, $index){
    	if($halaman == 'cosine'){
    		$this->totalRelevanCos = Hadits::where('index', $index)->count();
    	}elseif ($halaman == 'jaccard') {
    		$this->totalRelevanJac = Hadits::where('index', $index)->count();
    	}
    }

    public function FN($halaman){
    	if($halaman == 'cosine'){
			$this->FN_cos = $this->totalRelevanCos - $this->TP_cos;
    	}elseif ($halaman = 'jaccard') {
    		$this->FN_jac = $this->totalRelevanJac - $this->TP_jac;
    	}
    }

    public function FP($halaman){
    	if($halaman == 'cosine'){
    		$this->FP_cos = $this->total_cos - $this->TP_cos;
    	}elseif ($halaman == 'jaccard') {
    		$this->FP_cos = $this->total_jac - $this->TP_jac;
    	}
    }

    public function Recall($halaman){
    	if($halaman == 'cosine'){
    		if($this->TP_cos != 0){
    			$this->recall_cos =  ($this->TP_cos / ($this->TP_cos + $this->FN_cos)) * 100;
    		}else{
    			$this->recall_cos =  0;
    		}
    	}elseif ($halaman == 'jaccard') {
    		if($this->TP_cos != 0){
    			$this->recall_jac =  ($this->TP_jac / ($this->TP_jac + $this->FN_jac)) * 100;
    		}else{
    			$this->recall_jac =  0;
    		}
    	}
    }

    public function Precision($halaman){
    	if($halaman == 'cosine'){
    		if($this->TP_cos != 0){
    			$this->precision_cos = ($this->TP_cos / ($this->TP_cos + $this->FP_cos)) * 100;
    		}else{
    			$this->precision_cos =  0;
    		}
    	}elseif ($halaman == 'jaccard') {
    		if($this->TP_cos != 0){
    			$this->precision_jac = ($this->TP_jac / ($this->TP_jac + $this->FP_jac)) * 100;
    		}else{
    			$this->precision_jac =  0;
    		}
    	}
    }


    public function input($keyword){
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
    	$result->total_cosine = $this->total_cos;
    	$result->total_jaccard = $this->total_jac;

    	$result->save();
    }
}
