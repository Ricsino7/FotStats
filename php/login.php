<?php

require_once("../../common/php/environment.php");
//kapcsolodunk az adatbazishoz
$db = new Database('fotstats'); 

$args = Util::getArgs();
//lekérjuk az emailt és a passwordot ha van ilyen akkor be lehet jelentkezni
$query = "SELECT
              `id`,
              `username`,
              `email`,
              `password`,
              `role`,
              `created_at`
           FROM
               `users`
           WHERE
               `email` = :email AND
               `password` = :password";

$result = $db->execute($query, $args);
//kapcsolat lezárása
$db = null;
//response váalaszt küldunk allitunk be
Util::setResponse($result);
