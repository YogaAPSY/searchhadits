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
                                     <button class="btn btn-md btn-primary" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"><span style="margin-left:10px;">Search</span></button>
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

    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <h4>Cosine Similarity</h4>
        <hr>
        <h4>
        {{ $total_cos }} results found for: <span class="text-navy">{{ $keyword }}</span>
        </h4>
        <small>Request time  ({{ $time_cosine }} seconds)</small>
        <hr>
        @foreach($cos as $hadits)
  
        <div class="search-result">
        <h3>Hadits {{ $hadits->nama_hadits }}</h3>
    <p>dokumen id {{ $hadits->id }}</p> 
        <?php  
          $hadits_index = (array)$hadits->index;
        ?>
        @if(in_array($keyword ,$hadits_index))
           <p style="color: blue;">Relevan <span class="glyphicon glyphicon-ok"></span></p>            
           @else
            <p style="color: red;">Tidak Relevan</p> <span class="glyphicon glyphicon-ok"></span>
          @endif
        <?php
          $text = preg_replace('/(' . $keyword . ')/i', '<span style="background-color:yellow">$1</span>', $hadits->hadits_translate);
          //$texts = str_limit($text, 600);
          $str_len = strlen($hadits->hadits_translate);
        ?>
        <p>
          <?php
            echo $str_len;
          ?>
        </p>
        <p>
        <?php
        echo $text;
        ?>
        </p>
        </div>
       <div class="hr-line-dashed"></div>
        @endforeach
      
        <div class="text-center">
          <div class="table-nav">
            <div class="paging">
              {{ $cos->links() }}
            </div>
          </div>
        </div>
    </div>

    <div class="col-lg-6">
      <h4>Jaccard Similarity</h4>
    <hr>
      <h4>
      {{ $total_jac }} results found for: <span class="text-navy">{{ $keyword }}</span>
      </h4>
      <small>Request time  ({{ $time_jaccard }} seconds)</small>
    <hr>
      @foreach($jac as $hadits)
 
      <div class="search-result">
      <h3>Hadits {{ $hadits->nama_hadits }}</h3>
    <p>dokumen id {{ $hadits->id }}</p> 
     <?php  
          $hadits_index = (array)$hadits->index;
        ?>
      @if(in_array($keyword ,$hadits_index))
           <p style="color: blue;">Relevan</p> <span class="glyphicon glyphicon-ok"></span>
           @else
            <p style="color: red;">Tidak Relevan</p> <span class="glyphicon glyphicon-ok"></span>
          @endif
     
        <?php
          $text = preg_replace('/(' . $keyword . ')/i', '<span style="background-color:yellow">$1</span>', $hadits->hadits_translate);
          //$texts = str_limit($text, 600);
           $str_len = strlen($hadits->hadits_translate);
        ?>
 
        <p>
          <?php
            echo $str_len;
          ?>
        </p>
        <p>
        <?php
        echo $text;
        ?>
        </p>
      </div>
     <div class="hr-line-dashed"></div>
      @endforeach
    
    <div class="text-center">
      <div class="table-nav">
         <div class="paging">
            {{ $jac->links() }}
         </div>
       </div>
    </div>
  </div>
</div>
  </div>
</div>
@endsection