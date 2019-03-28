<?php

namespace App\Http\Controllers;

use App\Hadits;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MainController;
use App\Http\Controllers\RecallPrecisionController;
use App\Http\Controllers\TfidfController;
use App\Jaccard;
use App\Result;
use App\Similarity;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Session;

class ViewController extends Controller
{
 
    private $keyword = [];
    private $total_cos;
    private $total_jac;
    private $rank_cosine = [];
    private $rank_jaccard = [];
    private $cos;
    private $jac;
    private $time_cosine;
    private $time_jaccard;
    private $averageCosine;
    private $averageJaccard;
    private $similarity;

   

    public function __construct(){
        $this->similarity = new MainController();
        $this->results = new RecallPrecisionController();
    }

    public function index(){
    	return view('home.search');
    }

    public function result(Request $request){
        if($request->get('search') !== NULL){
        $this->keyword = $request->get('search');

        $this->jaccard();
        $this->cosine();

        $cos = $this->cos;
        $jac = $this->jac;
        $total_cos = $this->total_cos;
        $total_jac = $this->total_jac;
        $time_cosine = $this->time_cosine;
        $time_jaccard = $this->time_jaccard;
        $keyword = $this->keyword;
        $keywords = implode(" ",$this->similarity->preprocessingQuery($keyword));
      

        $this->cos->appends($request->only('search'));
        $this->jac->appends($request->only('search'));

        $this->cos = $this->data;
        $cosArr = $this->cos;

        $this->jac = $this->data;
        $jacArr = $this->jac;

        $this->results->input($keyword);


        return view('home.result', compact('cos', 'cosArr', 'jac','jacArr','total_cos', 'total_jac', 'time_cosine','time_jaccard', 'halaman','keyword','keywords'));
        } else {
            return 'Masukan Keyword';
        }

    }

      public function similarity(){
        $cosine = $this->similarity->cosine->paginate(10, ['*'], 'page1');
        $jaccard = $this->similarity->jaccard->paginate(10, ['*'], 'page2');

        $n_cos = $this->total_cos;

        if($n_cos != 0){
            $total_cos = $this->similarity->cosine->sum('cosine_similarity');
            $this->averageCosine = $total_cos / $n_cos;
        }else{
            $total_cos = 0;
            $this->averageCosine = 0;
        }
        $averageCosine = $this->averageCosine;

        $n_jac = $this->total_jac;
        if($n_jac != 0 ){                    
            $total_jac = $this->similarity->jaccard->sum('jaccard_similarity');
            $this->averageJaccard = $total_jac / $n_jac;
        }else{
            $total_jac = 0;
            $this->averageJaccard = 0;
        }
        $averageJaccard = $this->averageJaccard;

        $cosine->render();
        $jaccard->render();

        return view('home.similarity', compact('cosine', 'jaccard', 'averageJaccard', 'averageCosine'));
    }


    public function table(){
        $table = $this->results->result->all();

         $n = $this->results->result->count();

        if($table && $n != 0){
            $r_cos = $this->results->result->sum('recall_cosine');
            $recall_cosine = $r_cos/ $n; 

            $r_jac = $this->results->result->sum('recall_jaccard');
            $recall_jaccard = $r_jac/$n;

            $p_cos = $this->results->result->sum('precision_cosine');
            $precision_cosine = $p_cos/$n; 

            $p_jac = $this->results->result->sum('precision_jaccard');
            $precision_jaccard = $p_jac/$n;
        }else{
            $recall_cosine = 0;
            $recall_jaccard = 0;

            $precision_cosine = 0;
            $precision_jaccard = 0;
        }

        return view('home.table', compact('table','recall_cosine', 'recall_jaccard', 'precision_cosine', 'precision_jaccard'));        
    }


    public function diagram(){
        $n = $this->results->result->count();

        if($n != 0){
            $r_cos = $this->results->result->sum('recall_cosine');
            $recall_cosine = $r_cos/ $n;

            $r_jac = $this->results->result->sum('recall_jaccard');
            $recall_jaccard = $r_jac/$n;

            $t_cos = $this->results->result->sum('time_cosine');
            $time_cos = $t_cos/$n;

            $p_cos = $this->results->result->sum('precision_cosine');
            $precision_cosine = $p_cos/$n; 

            $p_jac = $this->results->result->sum('precision_jaccard');
            $precision_jaccard = $p_jac/$n;

            $t_jac = $this->results->result->sum('time_jaccard');
            $time_jac = $t_jac/$n;
        }else{
            $recall_cosine = 0;
            $recall_jaccard = 0;

            $precision_cosine = 0;
            $precision_jaccard = 0;

            $time_cos = 0;
            $time_jac = 0;
        }
            $n_cos = $this->similarity->cosine->count();

            if($n_cos != 0){
                $total_cos = $this->similarity->cosine->sum('cosine_similarity');
                $this->averageCosine = $total_cos / $n_cos;
            }else{
                $total_cos = 0;
                $this->averageCosine = 0;
            }
            $averageCosine = $this->averageCosine * 100;

            $n_jac = $this->similarity->jaccard->count();
            if($n_jac != 0 ){                    
                $total_jac = $this->similarity->jaccard->sum('jaccard_similarity');
                $this->averageJaccard = $total_jac / $n_jac;
            }else{
                $total_jac = 0;
                $this->averageJaccard = 0;
            }
            $averageJaccard = $this->averageJaccard * 100;


        return view('home.diagram', compact('recall_cosine', 'recall_jaccard', 'precision_cosine', 'precision_jaccard', 'time_cos', 'time_jac', 'averageJaccard', 'averageCosine'));
    }


    public function cosine(){
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

        $this->total_cos = count($this->rank_cosine);
        //print_r($this->rank_cosine);
    
        $this->cos = $this->similarity->hadits->whereIn('id', $this->rank_cosine)->paginate($perPage, ['*'], 'page1');
        $this->cosArr = $this->cos->toArray();
        $this->data = $this->cosArr['data'];
        array_multisort($rank_cosine_paginate, SORT_DESC, $this->data);
        //$this->cosArr = $this->cos->toArray();
        //array_multisort($this->rank_cosine, SORT_DESC, $this->cosArr);

        $executionEndTime = microtime(true);
        $this->time_cosine = $executionEndTime - $executionStartTime;

        $this->results->resultCosine($this->keyword , $this->total_cos, $this->time_cosine, $this->rank_cosine);
    }

    public function jaccard(){
    
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

        $this->total_jac = count($this->rank_jaccard);
        //print_r($this->rank_jaccard);


        $this->jac = $this->similarity->hadits->whereIn('id', $this->rank_jaccard)->paginate(10, ['*'], 'page2');
        
        $this->jacArr = $this->jac->toArray();
        $this->data = $this->jacArr['data'];
        array_multisort($rank_jaccard_paginate, SORT_DESC, $this->data);

        $executionEndTime = microtime(true);
        $this->time_jaccard = $executionEndTime - $executionStartTime;

        $this->results->resultJaccard($this->keyword, $this->total_jac, $this->time_jaccard, $this->rank_jaccard);
    }
    
    public function deleteResult(){
        
        $this->results->result->truncate();

        Session::flash('flash_message', 'Result telah berhasil dihapus');

        return redirect('table');
    }

    public function deleteSimilarity(){

        $this->similarity->cosine->truncate();
        $this->similarity->jaccard->truncate();

        Session::flash('message', 'Similarity telah berhasil dihapus');

        return redirect('similarity');
    }
}
        