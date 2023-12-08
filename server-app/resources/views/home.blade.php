@extends('layouts.app')

@section('content')
<div class="container">
    

@foreach ($timers as $tim)
<div class="row">
    <div class="col-sm">
      {{$tim->stamp}}
    </div>
    <div class="col-sm">
    {{$tim->full_name}}
    </div>
    <div class="col-sm">
    <select class="form-select" aria-label="Default select example">
    <option selected></option>
    @foreach ($spells as $sp)
  <option value="2">{{$sp->title}}</option>
  @endforeach
</select>
    </div>
    
  </div>
  @endforeach


</div>
@endsection
