<?php
require_once('../../common/php/environment.php');

// adatbázis kapcsolat
$db = new Database('fotstats');

// hírek lekérése
$rows = $db->execute(
  "SELECT 
      cim AS News,
      datum AS Dátum, 
      forras AS Forrás, 
      osszefoglalo AS Hírek,
      kep AS kepek
   FROM news"
);

// kapcsolat lezárása
$db = null;

// JSON válasz frontendnek
// ha nincs adat → üres tömb
echo json_encode($rows ?: [], JSON_PRETTY_PRINT);
