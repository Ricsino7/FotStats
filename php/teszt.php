<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');

// Nézzük meg van-e bármi a meccsek_statisztika táblában
$stat = $db->execute("SELECT * FROM meccsek_statisztika");
echo "Statisztikák száma: " . count($stat) . "\n";
print_r($stat);

// Nézzük meg a meccsek táblát
$meccsek = $db->execute("SELECT * FROM meccsek WHERE id IN (SELECT meccs_id FROM meccsek_statisztika)");
echo "\nMeccsek száma: " . count($meccsek) . "\n";
print_r($meccsek);

$db = null;
?>