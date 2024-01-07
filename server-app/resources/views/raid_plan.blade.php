@extends('layouts.app')

@section('content')
<div class="container">

<h2>{{$bossObj->name}}</h2>
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
@foreach ($assignments  as $k => $assign)
<tr>
<td>{{$assign['stamp']}}</td>
<td>{{$assign['short_title']}}</td>
<td>{{$assign['name']}}</td>
<td>
@foreach ($assign['assigns']  as $k2 => $cds)

{{$cds->friendlyName}}  <img class="spellicon" src="{{ mix('resources/images/'.$cds->filename.'.jpg') }}">
@endforeach
</td>


</tr>
@endforeach
</tbody>
</table>
</div>
@endsection