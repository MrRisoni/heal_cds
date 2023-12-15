@extends('layouts.app')

@section('content')
<div class="container">
<table class="table">
<thead>
    <tr>
      <th scope="col">Time</th>
      <th scope="col">Enemy</th>
      <th scope="col">Player</th>
      <th scope="col">Heal</th>

    </tr>
  </thead>
<tbody>
@foreach ($assignments as $as)
<tr>
<td>{{$as->stamp}}</td>
<td>{{$as->short_title}}</td>
<td>{{$as->name}}</td>
@if (!is_null($as->friendlyName))
<td>{{$as->friendlyName}}  <img class="spellicon" src="{{ mix('resources/images/'.$as->filename.'.jpg') }}"></td>
@else
<td></td>
@endif


</tr>
@endforeach
</tbody>
</table>
</div>
@endsection