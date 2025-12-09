<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');

$rows = $db->execute("
    SELECT 
        c.helyezes AS Helyezés,
        c.nev AS Csapatnév,
        l.nev AS Liga
    FROM csapatok c
    INNER JOIN ligak l ON c.liga_id = l.id
");

$db = null;

echo json_encode($rows ?: []);
