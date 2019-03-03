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
 <div class="container bootstrap snippet">
    <div class="row">
      <div class="col-lg-12">
         @if(Session::has('flash_message'))
        <div class="alert alert-success">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          {{ Session::get('flash_message') }}
        </div>
        @endif
        <h2>Confusion Matrix</h2>
        <table class="table table-bordered">
          <tr>
            <th> </th>
              <th>Relevan</th>
              <th>Not Relevan</th>
          </tr>
          <tr>
            <th>Retrieved</th>
            <th>TP</th>
            <th>FP</th>
          </tr>
          <tr>
            <th class="warning">Not Retrieved</th>
            <th>TN</th>
            <th>FN</th>
          </tr>
        </table>
        <h4>TP : True Positive</h4>
        <h4>FP : False Positive</h4>
        <h4>FN : False Negative</h4>
      </div>
        <div class="col-lg-12">
            <h4>Cosine Similarity</h4>
            <table class="table table-striped">
              <tr>
                <th>No</th>
                <th>Keyword</th>
                <th>Total</th>
                <th>TP</th>
                <th>FP</th>
                <th>FN</th>
                <th>Recall</th>
                <th>Precision</th>
              </tr>
              <?php $i = 1; ?>
              @if(!count($table))
                <tr>
                    <td>{{ $i++ }}</td>
                    <td> - </td>
                    <td> 0 </td>
                    <td> 0 </td>
                    <td> 0 </td>
                    <td> 0 </td>
                    <td> 0 </td>
                    <td> 0 </td>
                </tr>
              @else
              @foreach($table as $tables)
                <tr>
                    <td>{{ $i++ }}</td>
                    <td>{{ $tables->keyword }}</td>
                    <td>{{ $tables->total_cosine }}</td>
                    <td>{{ $tables->tp_cosine }}</td>
                    <td>{{ $tables->fp_cosine }}</td>
                    <td>{{ $tables->fp_cosine }}</td>
                    <td>{{ $tables->recall_cosine }}</td>
                    <td>{{ $tables->precision_cosine }}</td>
                </tr>
              @endforeach
              @endif
              <tr>
                <th>Rata-rata</th>
                <td> </td>
                <td> </td>
                <td> </td>
                <td> </td>
                <td> </td>
                <td>{{ $recall_cosine }}</td>
                <td>{{ $precision_cosine }}</td>
              </tr>
            </table>

            <h4>Jaccard Similarity</h4>
            <table class="table table-striped">
              <tr>
                <th>No</th>
                <th>Keyword</th>
                <th>Total</th>
                <th>TP</th>
                <th>FP</th>
                <th>FN</th>
                <th>Recall</th>
                <th>Precision</th>
              </tr>
              <?php $i = 1; ?>
               @if(!count($table))
                <tr>
                    <td>{{ $i++ }}</td>
                    <td> - </td>
                    <td> 0 </td>
                    <td> 0 </td>
                    <td> 0 </td>
                    <td> 0 </td>
                    <td> 0 </td>
                    <td> 0 </td>
                </tr>
              @else
              @foreach($table as $tables)
                <tr>
                    <td>{{ $i++ }}</td>
                    <td>{{ $tables->keyword }}</td>
                    <td>{{ $tables->total_jaccard }}</td>
                    <td>{{ $tables->tp_jaccard }}</td>
                    <td>{{ $tables->fp_jaccard }}</td>
                    <td>{{ $tables->fp_jaccard }}</td>
                    <td>{{ $tables->recall_jaccard }}</td>
                    <td>{{ $tables->precision_jaccard }}</td>
                </tr>
              @endforeach
              @endif
              <tr>
                <th>Rata-rata</th>
                <td> </td>
                <td> </td>
                <td> </td>
                <td> </td>
                <td> </td>
                <td>{{ $recall_jaccard }}</td>
                <td>{{ $precision_jaccard }}</td>
              </tr>
            </table>
        </div>
        <a href="{{ url('delete')}} " class="btn btn-md btn-danger">Delete All Result</a>
    </div>
</div>
@endsection