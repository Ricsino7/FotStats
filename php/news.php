<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');
$rows = $db->execute("SELECT `id`, `cim`, `datum`, 
                `forras`, `osszefoglalo`
         FROM `news`");
$db = null;

echo json_encode($rows ?: []);
