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
   

    <div class="dropdown">
  <button class="dropbtn">Dropdown</button>
  <div class="dropdown-content">
  <a href="#">Link 1</a>
  <a href="#">Link 2</a>
  <a href="#">Link 3</a>
  </div>
</div>
     
    </div>
    
  </div>
  @endforeach


</div>
@endsection
