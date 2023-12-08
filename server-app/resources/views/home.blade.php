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
  <a href="#"> <img src="https://wow.zamimg.com/images/wow/icons/large/spell_holy_divineillumination.jpg"/>Link 1</a>
  </div>
</div>
     
    </div>
    
  </div>
  @endforeach


</div>
@endsection
