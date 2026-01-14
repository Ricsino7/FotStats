<?php
require_once('../../common/php/environment.php');

// adatbázis kapcsolat
$db = new Database('fotstats');

/*
  Meccsek + statisztikák lekérése
  COALESCE: ha nincs statisztika (NULL), akkor 0-val tér vissza
*/
$rows = $db->execute("
  SELECT 
    c1.nev AS Haz,
    c2.nev AS Ven,
    m.eredmeny AS Ered,
    m.datum AS Dat,
    l.nev AS Lig,

    -- hazai statok
    COALESCE(sh.golok, 0) AS HazaiGol, 
    COALESCE(sh.lovesek, 0) AS HazaiLov,
    COALESCE(sh.passzok, 0) AS HazaiPasszok,
    COALESCE(sh.labdabirtoklas, 0.00) AS HazaiLabbirtoklas,

    -- vendég statok
    COALESCE(sv.golok, 0) AS VendegGol,
    COALESCE(sv.lovesek, 0) AS VendegLoves,
    COALESCE(sv.passzok, 0) AS VendegPasszok,
    COALESCE(sv.labdabirtoklas, 0.00) AS VendegLabbirtoklas

  FROM meccsek m
  INNER JOIN csapatok c1 ON m.csapat1_id = c1.id
  INNER JOIN csapatok c2 ON m.csapat2_id = c2.id
  INNER JOIN ligak l ON m.liga_id = l.id

  LEFT JOIN statisztikak sh 
    ON sh.meccs_id = m.id 
   AND sh.csapat_id = m.csapat1_id

  LEFT JOIN statisztikak sv 
    ON sv.meccs_id = m.id 
   AND sv.csapat_id = m.csapat2_id

  -- csak azok a meccsek, ahol mindkét csapatnak van statja
  WHERE sh.id IS NOT NULL 
    AND sv.id IS NOT NULL

  ORDER BY m.datum DESC
");

/*
  Ha nincs statisztika egy meccshez sem,
  akkor legalább az alap meccs adatokat adjuk vissza 0 statokkal
*/
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

// kapcsolat lezárása
$db = null;

// JSON válasz frontendnek
// ha nincs adat → üres tömb
echo json_encode($rows ?: [], JSON_PRETTY_PRINT);
