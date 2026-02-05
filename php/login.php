<?php

require_once("../../common/php/environment.php");

$db = new Database('fotstats'); 

$args = Util::getArgs();

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

$db = null;

Util::setResponse($result);
