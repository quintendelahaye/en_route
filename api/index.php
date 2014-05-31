<?php

define("WWW_ROOT",dirname(dirname(__FILE__)).DIRECTORY_SEPARATOR);

require_once WWW_ROOT. "api" .DIRECTORY_SEPARATOR. 'Slim'. DIRECTORY_SEPARATOR .'Slim.php';

require_once WWW_ROOT. "dao" .DIRECTORY_SEPARATOR. 'UsersDAO.php';


\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();

$usersDAO = new UsersDAO();

//HIERO

$app->get("/users/?", function() use ($usersDAO){
	header("Content-Type:application/json");
	echo json_encode($usersDAO->getUsers());
	exit();
});

$app->run();