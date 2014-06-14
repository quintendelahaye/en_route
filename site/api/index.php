<?php

define("WWW_ROOT",dirname(dirname(__FILE__)).DIRECTORY_SEPARATOR);

require_once WWW_ROOT. "api" .DIRECTORY_SEPARATOR. 'Slim'. DIRECTORY_SEPARATOR .'Slim.php';

require_once WWW_ROOT. "dao" .DIRECTORY_SEPARATOR. 'GroupsDAO.php';
require_once WWW_ROOT. "dao" .DIRECTORY_SEPARATOR. 'MembersDAO.php';
require_once WWW_ROOT. "dao" .DIRECTORY_SEPARATOR. 'Mission3DAO.php';


\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();

$groupsDAO = new GroupsDAO();
$membersDAO = new MembersDAO();
$mission3DAO = new Mission3DAO();

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
    echo json_encode($groupsDAO->insertGroup($post['groupname'],$post['password']));
    exit();
});

$app->post('/user/?', function() use ($app, $groupsDAO){
    header("Content-Type: application/json");
    $post = $app->request->post();
    if(empty($post)){
        $post = (array) json_decode($app->request()->getBody());
    }
    echo json_encode($groupsDAO->insertUser($post['groupid'],$post['user']));
    exit();
});

$app->get("/users/:groupid/?", function($groupid) use ($membersDAO){
    header("Content-Type:application/json");
    echo json_encode($membersDAO->getMembers($groupid));
    exit();
});

$app->post('/users/?', function() use ($app, $membersDAO){
    header("Content-Type: application/json");
    $post = $app->request->post();
    if(empty($post)){
        $post = (array) json_decode($app->request()->getBody());
    }
    $error = false;
    foreach ($post['members'] as $value){
        if (!$membersDAO->insertMember($value,$post['groupid'])) {
            $error = true;
        }
    }
    if (!$error) {
        echo json_encode($post);
    }
    exit();
});

$app->post('/mission3/?', function() use ($app, $mission3DAO){
    header("Content-Type: application/json");
    $post = $app->request->post();
    if(empty($post)){
        $post = (array) json_decode($app->request()->getBody());
    }
    $error = false;
    foreach ($post['shops'] as $value){
        if (!$mission3DAO->insertShop($post['groupid'],$value)) {
            $error = true;
        }
    }
    if (!$error) {
        echo json_encode($post);
    }
    exit();
});

$app->run();