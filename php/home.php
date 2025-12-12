<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');

$rows = $db->execute("
    SELECT 
        c.helyezes AS Helyezes,
        c.nev AS Csapatnev,
        c.Pontszam AS Pontszamok,
        l.nev AS Liga,
        l.kep AS kepek
    FROM csapatok c
    INNER JOIN ligak l ON c.liga_id = l.id
");

echo json_encode($rows ?: [], JSON_PRETTY_PRINT);
