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
              <li class="breadcrumb-item active" aria-current="page"><a href="{{ url ('search') }}">Similarity</a></li>
              <li class="breadcrumb-item"><a href="#">Table Rank</a></li>
              <li class="breadcrumb-item active" aria-current="page"><a href="#">Diagram</a></li>
            </ol>
          </nav>          
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <h4>Cosine Similarity</h4>
          <table class="table table-striped">
            <tr>
              <th>Keyword</th>
              <th>Dokumen ditemukan</th>
              <th>TP</th>
              <th>FN</th>
              <th>FP</th>
              <th>Recall</th>
              <th>Precision</th>
            </tr>
            <tr>
              <td>{{ $keyword }}</td>
              <td>{{ $total_cos }}</td>
              <td>{{ $TP_cos }}</td>
              <td>{{ $FN_cos }}</td>
              <td>{{ $FP_cos }}</td>
              <td>{{ round($recall_cos,2) }}%</td>
              <td>{{ round($precision_cos,2) }}%</td>
            </tr>
           </table>
        <hr>
        <h4>
        {{ $total_cos }} results found for: <span class="text-navy">{{ $keyword }}</span>
        </h4>
        <small>Request time  ({{ $time_cosine }} seconds)</small>
        <hr>
        @foreach($cosArr as $hadits)
        <?php  
          $hadits = (object)$hadits;
        ?>
        <div class="search-result">
        <h3>Hadits Bukhari No.{{ $hadits->no_hadits }}</a></h3>
    
        <p>
        {{ str_limit($hadits->hadits_translate, 200) }}
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
      <table class="table table-striped">
        <tr>
          <th>Keyword</th>
          <th>Dokumen ditemukan</th>
          <th>TP</th>
          <th>FN</th>
          <th>FP</th>
          <th>Recall</th>
          <th>Precision</th>
        </tr>
        <tr>
          <td>{{ $keyword }}</td>
          <td>{{ $total_jac }}</td>
          <td>{{ $TP_jac }}</td>
          <td>{{ $FN_jac }}</td>
          <td>{{ $FP_jac }}</td>
          <td>{{ round($recall_jac,2) }}%</td>
          <td>{{ round($precision_jac,2) }}%</td>
        </tr>
      </table>
    <hr>
      <h4>
      {{ $total_jac }} results found for: <span class="text-navy">{{ $keyword }}</span>
      </h4>
      <small>Request time  ({{ $time_jaccard }} seconds)</small>
    <hr>
      @foreach($jacArr as $hadits)
       <?php  
          $hadits = (object)$hadits;
        ?>
      <div class="search-result">
      <h3>Hadits Bukhari No.{{ $hadits->no_hadits }}</a></h3>

      <p>
      {{ str_limit($hadits->hadits_translate, 200) }}
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