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
              <li class="breadcrumb-item"><a href="{{ url('table') }}">Table Rank</a></li>
              <li class="breadcrumb-item active" aria-current="page"><a href="{{ url('diagram') }}">Diagram</a></li>
            </ol>
          </nav>          
        </div>
      </div>
    </div>
    <br>
 <div class="container bootstrap snippet" style="margin-top: 5%;">
    <div class="row">
        <div class="col-lg-12">
            <h4>Cosine Similarity</h4>
            <table class="table table-striped">
              <tr>
                <th>No</th>
                <th>Keyword</th>
                <th>True Positive</th>
                <th>False Positive</th>
                <th>False Negative</th>
                <th>Recall</th>
                <th>Precision</th>
              </tr>
              <?php $i = 1; ?>
              @foreach($table as $tables)
                <tr>
                    <td>{{ $i++ }}</td>
                    <td>{{ $tables->keyword }}</td>
                    <td>{{ $tables->tp_cosine }}</td>
                    <td>{{ $tables->fp_cosine }}</td>
                    <td>{{ $tables->fp_cosine }}</td>
                    <td>{{ $tables->recall_cosine }}</td>
                    <td>{{ $tables->precision_cosine }}</td>
                </tr>
              @endforeach
            </table>

            <h4>Jaccard Similarity</h4>
            <table class="table table-striped">
              <tr>
                <th>No</th>
                <th>Keyword</th>
                <th>True Positive</th>
                <th>False Positive</th>
                <th>False Negative</th>
                <th>Recall</th>
                <th>Precision</th>
              </tr>
              <?php $i = 1; ?>
              @foreach($table as $tables)
                <tr>
                    <td>{{ $i++ }}</td>
                    <td>{{ $tables->keyword }}</td>
                    <td>{{ $tables->tp_jaccard }}</td>
                    <td>{{ $tables->fp_jaccard }}</td>
                    <td>{{ $tables->fp_jaccard }}</td>
                    <td>{{ $tables->recall_jaccard }}</td>
                    <td>{{ $tables->precision_jaccard }}</td>
                </tr>
              @endforeach
            </table>
        </div>


    </div>
</div>
@endsection