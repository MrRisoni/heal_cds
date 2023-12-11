@extends('layouts.app')

@section('content')
<div class="container">

<form action="/save_timer" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="text" class="form-control" id="stampText"   name="stampText" aria-describedby="emailHelp" placeholder="Enter email">
  </div>

  <input type="hidden"  id="bossId"  name="bossId" value="{{$boss_id}}">


  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <select class="form-select" id="abilitySelectId"  name="abilitySelectId" aria-label="Default select example">
    @foreach ($abilities as $ab)

  <option value="{{ $ab->id }}">{{ $ab->short_title }}</option>
  @endforeach  
</select>
   
  </div>

  
  <button type="submit" class="btn btn-primary">Submit</button>
</form>

</div>
@endsection