<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');
$rows = $db->execute("SELECT `helyezes` AS Helyezés, 
                            `nev` AS Csapatnév, 
                            `orszag` AS Liga
         FROM `csapatok`
         WHERE `liga_id` = 1");
$db = null;


echo json_encode($rows ?: []);
