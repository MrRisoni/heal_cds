hey

<table class="table table-striped">
<thead>
    <tr>
        <th scope="col">Ability</td>
        <th scope="col">Timer</td>
        <th scope="col">Heal Spell</td>
</tr>
</thead>    
<tbody>
@foreach ($assigns as $sng)
    <tr>
    <td> {{ $sng->short_title }}</td>
    <td> {{ $sng->stamp }}</td>
    <td> {{ $sng->friendlyName }}</td>
</tr>
@endforeach
</tbody>
</table>