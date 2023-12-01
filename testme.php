<?php

$mysqli = new mysqli('localhost', 'root', '', 'healing');

printf("Success... %s\n", $mysqli->host_info);

$result = $mysqli->query("
SELECT t.stamp,ba.enemy_spell_id,ba.enemy_color, ba.short_title , p.color,p.name, s.friendly_spell_id
FROM boss_timing t 
JOIN boss_abilities ba ON ba.id = t.ability_id
JOIN assignments a ON a.timer_id = t.id
JOIN players p ON p.id = a.player_id
JOIN spells s ON s.id = a.heal_spell_id
WHERE ba.boss_id  =2
ORDER BY t.order_id ASC", MYSQLI_USE_RESULT);


$mrtArray = [];
while ($row = mysqli_fetch_assoc($result)) {
//	{time:03:58}{spell:420846} |cffCC0000Phase 2 Dmg|r - |cfffefefeAkumai|r {spell:246287}  

	$mrtArray[] = '{time:'.$row['stamp'].'}{spell:'.$row['enemy_spell_id'].'} |'.$row['enemy_color'].$row['short_title'].'|r -|'.$row['color'].$row['name'].'|r {spell:'.$row['friendly_spell_id'].'}';
}

echo implode ('<br>',$mrtArray);