@extends('layouts.app')

@section('content')
<div class="container">

<form action="/plan/save_cd" method="post">
 


  <div class="form-group">
    <label for="timerSelectId">Timer</label>
    <select class="form-select" id="timerSelectId"  name="timerSelectId" aria-label="Default select example">
    @foreach ($timers as $tim)
  <option value="{{ $tim->id }}">{{ $tim->stamp }} - {{ $tim->short_title }}</option>
  @endforeach  
</select>
   
  </div>


  <div class="form-group">
    <label for="spellSelectId">Spell</label>
    <select class="form-select" id="spellSelectId"  name="spellSelectId" aria-label="Default select example">
    @foreach ($spells as $sp)
  <option value="{{ $sp->id }}"> {{ $sp->title }}</option>
  @endforeach  
</select>
   
  </div>

  
  <button type="submit" class="btn btn-primary">Submit</button>
</form>

</div>
@endsection