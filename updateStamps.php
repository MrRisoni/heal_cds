<?php

$mysqli = new mysqli('localhost', 'root', 'root', 'healing');

printf("Success... %s\n", $mysqli->host_info);

$result = $mysqli->query("
SELECT  id,stamp FROM custom_timers ", MYSQLI_USE_RESULT);


$data=[];
while ($row = mysqli_fetch_assoc($result)) {

	$stampArray = explode(':',$row['stamp']);
	$id= $row['id'];

	$seconds = $stampArray[0]* 60 + $stampArray[1];
	$data[$id] = $seconds;
}

foreach($data as $key => $value)
{
	mysqli_query($mysqli,"UPDATE custom_timers SET timer = '".$value."' WHERE id  = '".$key."'" );
}