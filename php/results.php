<?php
require_once('../../common/php/environment.php');

$db = new Database('fotstats');

// Első lekérdezés: meccsek statisztikákkal
$rows = $db->execute("
SELECT 
    c1.nev AS Hazai,
    c2.nev AS Vendeg,
    m.eredmeny AS Eredmény,
    m.datum AS Dátum,
    l.nev AS Liga,
    COALESCE(sh.golok, 0) AS 'Hazai Golok',
    COALESCE(sh.lovesek, 0) AS 'Hazai Lovesek',
    COALESCE(sh.passzok, 0) AS 'Hazai Passzok',
    COALESCE(sh.labdabirtoklas, 0.00) AS 'Hazai Labbirtoklas',
    COALESCE(sv.golok, 0) AS 'Vendeg Golok',
    COALESCE(sv.lovesek, 0) AS 'Vendeg Lovesek',
    COALESCE(sv.passzok, 0) AS 'Vendeg Passzok',
    COALESCE(sv.labdabirtoklas, 0.00) AS 'Vendeg Labbirtoklas'
FROM meccsek m
INNER JOIN csapatok c1 ON m.csapat1_id = c1.id
INNER JOIN csapatok c2 ON m.csapat2_id = c2.id
INNER JOIN ligak l ON m.liga_id = l.id
LEFT JOIN statisztikak sh ON sh.meccs_id = m.id AND sh.csapat_id = m.csapat1_id
LEFT JOIN statisztikak sv ON sv.meccs_id = m.id AND sv.csapat_id = m.csapat2_id
WHERE sh.id IS NOT NULL AND sv.id IS NOT NULL
ORDER BY m.datum DESC
");

// Ha nincs egy meccsnek sem statisztikája, akkor legalább a meccsek adatait visszaadjuk
if (empty($rows)) {
    $rows = $db->execute("
    SELECT 
        m.id AS Meccs_ID,
        c1.nev AS Hazai,
        c2.nev AS Vendeg,
        m.eredmeny AS Eredmény,
        m.datum AS Dátum,
        l.nev AS Liga,
        0 AS Hazai_Golok,
        0 AS Hazai_Lovesek,
        0 AS Hazai_Passzok,
        0.00 AS Hazai_Labbirtoklas,
        0 AS Vendeg_Golok,
        0 AS Vendeg_Lovesek,
        0 AS Vendeg_Passzok,
        0.00 AS Vendeg_Labbirtoklas
    FROM meccsek m
    INNER JOIN csapatok c1 ON m.csapat1_id = c1.id
    INNER JOIN csapatok c2 ON m.csapat2_id = c2.id
    INNER JOIN ligak l ON m.liga_id = l.id
    ORDER BY m.datum DESC
    ");
}

$db = null;

echo json_encode($rows ?: [], JSON_PRETTY_PRINT);