<?php

define("WWW_ROOT",dirname(dirname(__FILE__)).DIRECTORY_SEPARATOR);

require_once WWW_ROOT. "api" .DIRECTORY_SEPARATOR. 'Slim'. DIRECTORY_SEPARATOR .'Slim.php';

require_once WWW_ROOT. "dao" .DIRECTORY_SEPARATOR. 'UsersDAO.php';


\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();

$usersDAO = new UsersDAO();

//HIERO

$app->get("/users/:groupname/:password/?", function($groupname,$password) use ($usersDAO){
	header("Content-Type:application/json");
	echo json_encode($usersDAO->getUserByGroupnameAndPassword($groupname,$password));
	exit();
});



$app->post('/users/?', function() use ($app, $usersDAO){
    header("Content-Type: application/json");
    $post = $app->request->post();
    if(empty($post)){
        $post = (array) json_decode($app->request()->getBody());
    }
    echo json_encode($usersDAO->insertUser($post['groupname'],$post['password']));
    exit();
});

$app->run();