<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');

$rows = $db->execute("
  SELECT 
    m.id,
    c1.nev AS hazai,
    c2.nev AS vendeg,
    m.eredmeny,
    DATE_FORMAT(m.datum, '%Y.%m.%d') AS datum
  FROM meccsek m
  INNER JOIN csapatok c1 ON m.csapat1_id = c1.id
  INNER JOIN csapatok c2 ON m.csapat2_id = c2.id
  WHERE m.id IN (SELECT meccs_id FROM meccsek_statisztika)
  ORDER BY m.datum DESC
");

$db = null;

header('Content-Type: application/json');
echo json_encode($rows ?: []);
?>