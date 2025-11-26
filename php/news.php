<?php

require_once("../common/php/environment.php");

$args = Util::getArgs();

$db = new Database('fotstats');

$query= "SELECT 'news', 'osszefoglalo' * FROM 'news'";

$response = $db->execute($query);

$db = null;

Util::setResponse($response);