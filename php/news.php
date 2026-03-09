<?php
require_once('../../common/php/environment.php');

// adatbázis kapcsolat
$db = new Database('fotstats');

// hírek lekérése
$rows = $db->execute(
  "SELECT 
      cim AS news,
      datum AS datum, 
      forras AS forras, 
      osszefoglalo AS hirek,
      kep AS kepek
   FROM news"
);

// kapcsolat lezárása
$db = null;

// JSON válasz frontendnek
// ha nincs adat → üres tömb
echo json_encode($rows ?: [], JSON_UNESCAPED_UNICODE | 
                              JSON_UNESCAPED_SLASHES);
