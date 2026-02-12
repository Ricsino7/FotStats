<?php

require_once("../../common/php/environment.php");

$db = new Database('fotstats'); 

$args = Util::getArgs();
//lekérjük az adatokat
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
//megnézzük hogy van e ilyen email vagy felhasznnáló
$query2 = "SELECT
               `id`
           FROM
               `users`
           WHERE
               `email` = :email OR
               `username` = :username";
//leellenörzi hogy van e ilyen 
$result2 = $db->execute($query2, [
    'email' => $args['email'],
    'username' => $args['username']
]);
//ha van ilyen felhasznalónév vagy email NULL érteket küld vissza
if ($result2 != NULL) {
  Util::setResponse(NULL);
}

$result = $db->execute($query, $args);
//lezárjuk a kapcsolatot
$db = null;

Util::setResponse($result);
