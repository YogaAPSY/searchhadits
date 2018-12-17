<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Hadits;
use Illuminate\Support\Facades\Session;

class InputController extends Controller
{
    public function index(){

    }

    public function create(){
    	return view('posts.input');
    }

    public function store(Request $request){
    	try{
    		$input = $request->all();

    		Hadits::create($input);
            Session::flash('flash_message', 'Data sudah berhasil di input');
            return redirect('input');

    	} catch (\Exception $e){
           return $e->getMessage();
        }
    }
}
