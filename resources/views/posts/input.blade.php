@extends('layouts.app')

@section('content')
      <div class="col-lg-10">
      <div class="page-header"><h1>New Post <i class="glyphicon glyphicon-pencil"></i></h1></div>
      @if(Session::has('flash_message'))
        <div class="alert alert-success">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          {{ Session::get('flash_message') }}
        </div>
      @endif
    <form class="form-horizontal" action="{{ url('store') }}" method="post" enctype="multipart/form-data">

      <div class="form-group">
        <label for="no_hadits">Nomor Hadits</label>
        <input type="text" id="no_hadits" name="no_hadits" class="form-control">
      </div>

      <div class="form-group">
        <label for="index">Index</label>
        <input type="text" id="index" name="index" class="form-control">
      </div>

      <div class="form-group">
        <label for="hadits_translate">Translate Hadits</label>
        <textarea id="hadits_translate" name="hadits_translate" class="form-control"></textarea>
      </div>

      <div class="form-group">
        <label for="submit"></label>
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <input type="submit" id="submit" name="submit_post" class="btn btn-danger btn-block">
      </div>
    </form>
    </div>
@endsection

@section('scripts')
@include('layouts.script')
@endsection