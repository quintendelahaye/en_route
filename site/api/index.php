<?php

define("WWW_ROOT",dirname(dirname(__FILE__)).DIRECTORY_SEPARATOR);

require_once WWW_ROOT. "api" .DIRECTORY_SEPARATOR. 'Slim'. DIRECTORY_SEPARATOR .'Slim.php';

require_once WWW_ROOT. "dao" .DIRECTORY_SEPARATOR. 'GroupsDAO.php';


\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();

$groupsDAO = new GroupsDAO();

//HIERO

$app->get("/groups/:groupname/:password/?", function($groupname,$password) use ($groupsDAO){
	header("Content-Type:application/json");
	echo json_encode($groupsDAO->getUserByGroupnameAndPassword($groupname,$password));
	exit();
});



$app->post('/groups/?', function() use ($app, $groupsDAO){
    header("Content-Type: application/json");
    $post = $app->request->post();
    if(empty($post)){
        $post = (array) json_decode($app->request()->getBody());
    }
    echo json_encode($groupsDAO->insertUser($post['groupname'],$post['password']));
    exit();
});

$app->run();