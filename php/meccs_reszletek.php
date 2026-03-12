<?php
require_once('../../common/php/environment.php');

if (!isset($_GET['id'])) {
  echo json_encode([]);
  exit;
}

$id = (int)$_GET['id'];
$db = new Database('fotstats');

$stat = $db->execute("
  SELECT 
    ms.perc,
    ms.type,
    cs.nev AS csapat,
    j.nev AS jatekos
  FROM meccsek_statisztika ms
  JOIN csapatok cs ON ms.csapat_id = cs.id
  LEFT JOIN jatekosok j ON ms.jatekos_id = j.id
  WHERE ms.meccs_id = {$id}
  ORDER BY ms.perc
");

$db = null;

header('Content-Type: application/json');
echo json_encode($stat ?: []);
?>