<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');
$rows = $db->execute("SELECT `csapat_id` AS Hazai,
                      `csapat2_id` AS Vendég, 
                `datum` AS Dátum, 
                `eredmeny` AS Eredmények,
                `liga_id` AS Liga
         FROM `meccsek`");
$db = null;

echo json_encode($rows ?: []);
