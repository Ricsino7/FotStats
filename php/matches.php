<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');

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

$db = null;

echo json_encode($rows ?: [],JSON_PRETTY_PRINT);
