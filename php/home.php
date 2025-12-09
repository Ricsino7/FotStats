<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');
$rows = $db->execute("SELECT `id`, `nev`, `orszag`, 
                `tipus`, `liga_id`, `helyezes`
         FROM `csapatok`");
$db = null;

echo json_encode($rows ?: []);
