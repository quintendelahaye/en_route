<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class Mission5DAO{

    public $pdo;

    public function __construct()
    {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function getAllVintagePics(){
        $sql = "SELECT *
                FROM enroute_opdracht5";
        $stmt = $this->pdo->prepare($sql);
        if($stmt->execute()){
            $vintagepics = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if(!empty($vintagepics)){
                return $vintagepics;
            }
            return false;
        }
    }
}