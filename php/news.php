<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');
$rows = $db->execute("SELECT `cim` AS News,
                      `datum` AS Dátum, 
                `forras` AS Forrás, 
                `osszefoglalo` AS Hírek
         FROM `news`");
$db = null;

echo json_encode($rows ?: []);
