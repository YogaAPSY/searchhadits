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
           @if(Session::has('message'))
        <div class="alert alert-success">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          {{ Session::get('message') }}
        </div>
        @endif
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
 <div class="container bootstrap snippet">
    <div class="row">
        <div class="col-lg-12">
            <h4>Cosine Similarity</h4>
            <table class="table table-striped">
              <tr>
                <th>No</th>
                <th>Keyword</th>
                <th>id dokumen</th>
                <th>Cosine Similarity</th>
              </tr>
              <?php $i = 1; ?>
              @foreach($cosine as $cosines)
                <tr>
                    <td>{{ $cosines->id }}</td>
                    <td>{{ $cosines->keyword }}</td>
                    <td>{{ $cosines->id_document }}</td>
                    <td>{{ $cosines->cosine_similarity }}</td>
                </tr>
              @endforeach
              <tr>
                <th>Rata-rata</th>
                <td> </td>
                <td> </td>
                <td>{{ $averageCosine}}</td>
              </tr>
            </table>

            <div class="text-center">
              <div class="table-nav">
                 <div class="paging">
                    {{ $cosine->links() }}
                 </div>
               </div>
            </div>

            <h4>Jaccard Similarity</h4>
            <table class="table table-striped">
               <tr>
                <th>No</th>
                <th>Keyword</th>
                <th>id dokumen</th>
                <th>Jaccard Similarity</th>
              </tr>
              <?php $i = 1; ?>
              @foreach($jaccard as $jaccards)
                <tr>
                    <td>{{ $jaccards->id }}</td>
                    <td>{{ $jaccards->keyword }}</td>
                    <td>{{ $jaccards->id_document }}</td>
                    <td>{{ $jaccards->jaccard_similarity }}</td>
                </tr>
              @endforeach
                <tr>
                <th>Rata-rata</th>
                <td> </td>
                <td> </td>
                <td>{{ $averageJaccard}}</td>
              </tr>
            </table>
            <div class="text-center">
              <div class="table-nav">
                 <div class="paging">
                    {{ $jaccard->links() }}
                 </div>
               </div>
            </div>
        </div>
        <a href="{{ url('deleteSimilarity')}} " class="btn btn-md btn-danger">Delete All Similarity</a>

    </div>
</div>
@endsection