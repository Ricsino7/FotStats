<?php
require_once('../../common/php/environment.php');

// adatbázis kapcsolat
$db = new Database('fotstats');

// hírek lekérése
$rows = $db->execute(
  ""
);

// kapcsolat lezárása
$db = null;

// JSON válasz frontendnek
// ha nincs adat → üres tömb
echo json_encode($rows ?: [], JSON_UNESCAPED_UNICODE | 
                              JSON_UNESCAPED_SLASHES);
