<?php

require_once("../../common/php/environment.php");

$db = new Database('fotstats'); 

$args = Util::getArgs();

$query = "INSERT INTO `users`(
              `username`,
              `email`,
              `password`
          )
          VALUES(
              :username,
              :email,
              :password
          )";

$query2 = "SELECT
               `id`
           FROM
               `users`
           WHERE
               `email` = :email OR
               `username` = :username";

$result2 = $db->execute($query2, [
    'email' => $args['email'],
    'username' => $args['username']
]);

if ($result2 != NULL) {
  Util::setResponse(NULL);
}

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);
