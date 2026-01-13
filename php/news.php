<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');
$rows = $db->execute(
  "SELECT `cim` AS News,
          `datum` AS Dátum, 
            `forras` AS Forrás, 
            `osszefoglalo` AS Hírek,
            `kep` AS kepek
  FROM `news`");

$db = null;

// Adatok JSON-ként visszaadása
// Ha nincs adat, üres tömböt küldünk
echo json_encode($rows ?: [],JSON_PRETTY_PRINT);
