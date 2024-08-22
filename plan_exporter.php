<?php

$plan = json_decode(file_get_contents('palace_plan.json'),TRUE);

$players = $plan['healers'];
$fyrakk = $plan['bosses']['Fyrrak'];


$myfile = fopen('Fyrakk_test.txt', 'w') or die('Unable to open file!');


foreach($fyrakk['plan'] as $pl) {

$bossSpellId =$pl['counter'];

$spellTitle = $fyrakk['spells'][$bossSpellId]['title'];


	$txt = '{time:'.$pl['time'].'}{spell:'.$bossSpellId.' } |cffCC0000'.$spellTitle.'|r - |cfffefefeAkumai|r {spell:'.$pl['cds'].'}'.PHP_EOL;
	echo $txt;
	fwrite($myfile, $txt);

}
fclose($myfile);

// {time:00:26}{spell:425025} |cffCC0000Charge AOE|r - |cfffefefeAkumai|r {spell:246287}  



?>