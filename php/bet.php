<?php
require_once('../../common/php/environment.php');

// adatbázis kapcsolat
$db = new Database('fotstats');

// bet adatainak lekérese + a csapatok hozzáadása JOIN hozzá
$rows = $db->execute(
  "SELECT
    m.id,
    ch.nev AS hazai,
    cv.nev AS vendeg,
    b.odd_hazai,
    b.odd_dontetlen,
    b.odd_vendeg,
    b.odd_over_25,
    b.odd_over_15,
    odd_under_15,
    odd_under_25,
    b.odd_btts_igen,
    b.odd_btts_nem,
    odd_szoglet_over_75,
    odd_szoglet_under_75,
    odd_tobb_szoglet_hazai,
    odd_tobb_szoglet_vendeg
    FROM meccsek m
    JOIN csapatok ch ON m.csapat1_id = ch.id
    JOIN csapatok cv ON m.csapat2_id = cv.id
    LEFT JOIN bet b ON b.meccs_id = m.id
    ORDER BY m.id;"
);

// kapcsolat lezárása
$db = null;

// JSON válasz frontendnek
// ha nincs adat → üres tömb
echo json_encode($rows ?: [], JSON_UNESCAPED_UNICODE | 
                              JSON_UNESCAPED_SLASHES);
