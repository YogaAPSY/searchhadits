@extends('layouts/app')

@section('content')
 <div class="container bootstrap snippet" style="margin-top: 5%;">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                     <h1 class="text-center">Search Title</h1>
                    <div class="search-form">
                        <form role="form" action="{{ url('search') }}">
                            <div class="input-group">
                                <input type="text" placeholder="Search" name="search" class="form-control input-lg">
                                <div class="input-group-btn">
                                     <button class="btn btn-lg btn-primary" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"><span style="margin-left:10px;">Search</span></button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <h2>
                        {{ $total }} results found for: <span class="text-navy">{{ $keyword }}</span>
                    </h2>
                    <small>Request time  ({{ $seconds }} seconds)</small>
                     @foreach($views as $hadits)
                    <div class="search-result">
                        <h3>Hadits Bukhari No.{{ $hadits->no_hadits }}</a></h3>
                        <p>
                            {{ $hadits->id }}
                        </p>
                        <p>
                          {{ str_limit($hadits->hadits_translate, 200) }}
                        </p>
                    </div>
                    <div class="hr-line-dashed"></div>
                    @endforeach
                    <div class="text-center">
                       <div class="table-nav">
                          <div class="paging">
                              {{ $views->links() }}
                          </div>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection