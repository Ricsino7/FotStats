<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');

$rows = $db->execute("
    SELECT 
        c.nev AS csapatnev,
        j.nev AS jatekosnev,
        j.poszt AS jatekosPoszt,
        c.kep AS kepek
    FROM csapatok c
    LEFT JOIN jatekosok j 
        ON c.id = j.csapat_id
    WHERE j.id IS NOT NULL
");




$db = null;

echo json_encode($rows ?: [], JSON_PRETTY_PRINT);
