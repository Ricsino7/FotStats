<?php
require_once("../../common/php/environment.php");

// adatbázis kapcsolat
$db = new Database("fotstats");

// csapatok lekérése
$teams = $db->execute("
  SELECT id, nev 
  FROM csapatok
");

// ligák lekérése
$leagues = $db->execute("
  SELECT id, nev 
  FROM ligak
");

$data = [];

// csapatok hozzáadása a keresőhöz
foreach ($teams as $t) {
  $data[] = [
    "id"   => $t["id"],
    "name" => $t["nev"],
    "type" => "team"
  ];
}

// ligák hozzáadása a keresőhöz
foreach ($leagues as $l) {
  $data[] = [
    "id"   => $l["id"],
    "name" => $l["nev"],
    "type" => "league"
  ];
}

// JSON válasz frontendnek
// ha nincs adat → üres tömb
echo json_encode($data, JSON_PRETTY_PRINT);
