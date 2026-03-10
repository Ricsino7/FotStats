<?php
require_once('../../common/php/environment.php');

// adatbázis kapcsolat
$db = new Database('fotstats');

// tabella adatok lekérése (csapat + liga)
$rows = $db->execute("
  SELECT 
      c.nev AS Csapat,
      l.nev AS Liga,
      l.kep AS kepek
  FROM csapatok c
  INNER JOIN ligak l ON c.liga_id = l.id
");

// JSON válasz frontendnek
// ha nincs adat → üres tömb
echo json_encode($rows ?: [], JSON_PRETTY_PRINT);
