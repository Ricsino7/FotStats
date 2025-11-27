<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');
$rows = $db->execute("SELECT * FROM `csapatok`");
$db = null;

echo json_encode($rows ?: []);
