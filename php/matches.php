<?php
require_once('../../common/php/environment.php');

// adatbázis kapcsolat
$db = new Database('fotstats');

// meccsek lekérése (hazai + vendég + liga)
$rows = $db->execute("
  SELECT 
    c1.nev AS hazai,
    c2.nev AS vendeg,
    m.datum AS datum,
    l.nev AS liga
  FROM meccsek m
  INNER JOIN csapatok c1 ON m.csapat1_id = c1.id
  INNER JOIN csapatok c2 ON m.csapat2_id = c2.id
  INNER JOIN ligak l ON m.liga_id = l.id
");

// kapcsolat lezárása
$db = null;

// JSON válasz frontendnek
// ha nincs adat → üres tömb
echo json_encode($rows ?: [], JSON_PRETTY_PRINT);
