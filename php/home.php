<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');

$rows = $db->execute("
    SELECT 
        c.helyezes AS '#',
        c.nev AS Csapat,
        c.lejatszottmeccs AS LM,
        c.gyozelem AS GY,
        c.dontetlen AS D, 
        c.vereseg AS V,   
        c.Pontszam AS P,
        c.Lottgol AS LG,
        c.kapottgol AS KG,
        c.golarany AS GK,
        l.nev AS Liga,
        l.kep AS kepek
    FROM csapatok c
    INNER JOIN ligak l ON c.liga_id = l.id
");

echo json_encode($rows ?: [], JSON_PRETTY_PRINT);
