@extends('layouts/app')

@section('content')
 <div class="container bootstrap snippet" style="margin-top: 5%;">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                     <h1 class="text-center">Search Hadits</h1>
                    <div class="search-form">
                        <form role="form" action="{{ url('search') }}">
                            <div class="input-group">
                                <input type="text" placeholder="Search" name="search" class="form-control input-lg">
                                <div class="input-group-btn">
                                     <button class="btn btn-md btn-primary" type="submit">
                                        <i class="glyphicon glyphicon-search"></i>Search</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
 <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">    
              <li class="breadcrumb-item active" aria-current="page"><a href="{{ url ('similarity') }}">Similarity</a></li>
              <li class="breadcrumb-item"><a href="{{ url('table') }}">Result</a></li>
              <li class="breadcrumb-item active" aria-current="page"><a href="{{ url('diagram') }}">Diagram</a></li>
            </ol>
          </nav>          
        </div>
      </div>
    </div>
    <br>
@endsection