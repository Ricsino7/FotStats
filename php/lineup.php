<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');

$rows = $db->execute("
    SELECT 
        c.nev AS Csapatnev
    FROM csapatok c
");

$db = null;

echo json_encode($rows ?: [], JSON_PRETTY_PRINT);
