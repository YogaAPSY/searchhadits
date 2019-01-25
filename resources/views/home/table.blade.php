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
                    <br>
                    
                    <div class="table">
                      <tr>
                        <th>df</th>
                        <th>idf</th>
                        <th>tfidf</th>
                      </tr>
                      <tr>
                        <td>{{ $df }}</td>
                        <td>{{ $idf }}</td>
                        <td>{{ $tfidf }}</td>
                      </tr>
                    </div>

               
            </div>
        </div>
    </div>
@endsection