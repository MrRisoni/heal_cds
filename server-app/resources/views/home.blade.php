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
  @foreach ($spells as $sp)
  <a href="#"> <img src="{{ mix('resources/images/evangelism.jpg') }}">{{$sp->title}}</a>
  @endforeach
  </div>

</div>
     
    </div>
    
  </div>
  @endforeach


</div>
@endsection
