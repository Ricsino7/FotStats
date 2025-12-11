<?php
require_once("../../common/php/environment.php");

$db = new Database("fotstats");

$teams = $db->execute("
    SELECT id, nev 
    FROM csapatok
");

$leagues = $db->execute("
    SELECT id, nev 
    FROM ligak
");

$data = [];

// csapatok hozzáadása
foreach ($teams as $t) {
    $data[] = [
        "id" => $t["id"],
        "name" => $t["nev"],
        "type" => "team"
    ];
}

// ligák hozzáadása
foreach ($leagues as $l) {
    $data[] = [
        "id" => $l["id"],
        "name" => $l["nev"],
        "type" => "league"
    ];
}

echo json_encode($data, JSON_PRETTY_PRINT);
?>
