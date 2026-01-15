<?php
require_once('../../common/php/environment.php');

// adatbázis kapcsolat
$db = new Database('fotstats');

// csapat + játékos adatok lekérése
$rows = $db->execute("
  SELECT 
    c.nev AS csapatnev,
    j.nev AS jatekosnev,

    -- poszt rövidítés
    CASE j.poszt_tmp
      WHEN 'Csatár' THEN 'csatar'
      WHEN 'Szélső' THEN 'szelso'
      WHEN 'Középpályás' THEN 'kozeppalyas'
      WHEN 'Védő' THEN 'vedo'
      WHEN 'Kapus' THEN 'kapus'
      WHEN 'Edző' THEN 'edzo'
      ELSE ''
    END AS jatekosPoszt,

    c.kep AS kepek
  FROM csapatok c
  LEFT JOIN jatekosok j ON c.id = j.csapat_id
  WHERE j.id IS NOT NULL
");

// kapcsolat lezárása
$db = null;

// JSON válasz frontendnek
// ha nincs adat → üres tömb
echo json_encode($rows ?: [], JSON_PRETTY_PRINT);
