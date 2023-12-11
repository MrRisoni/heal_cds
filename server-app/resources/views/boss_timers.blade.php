@extends('layouts.app')

@section('content')
<div class="container">
<table class="table">
<thead>
    <tr>
    <th scope="col">id</th>
      <th scope="col">Time</th>
      <th scope="col">Ability</th>
    </tr>
  </thead>
<tbody>
@foreach ($timers as $tim)
<tr>
<td>{{$tim->id}}</td>
<td>{{$tim->stamp}}</td>
<td>{{$tim->full_name}}</td>
</tr>
@endforeach
</tbody>
</table>
</div>
@endsection