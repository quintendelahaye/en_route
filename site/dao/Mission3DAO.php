<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class Mission3DAO{

    public $pdo;

    public function __construct()
    {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function getAllShopsAndAmount(){
        $sql = "SELECT shop_name, COUNT(*) AS numberOFShops
                FROM enroute_opdracht3
                GROUP BY shop_name";
        $stmt = $this->pdo->prepare($sql);
        if($stmt->execute()){
            $shops = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if(!empty($shops)){
                return $shops;
            }
            return false;
        }
    }

    public function getTop3Shops(){
        $sql = "SELECT shop_name, COUNT(*) AS numberOFShops
                FROM enroute_opdracht3
                GROUP BY shop_name
                ORDER BY (numberOFShops) DESC
                LIMIT 3";
        $stmt = $this->pdo->prepare($sql);
        if($stmt->execute()){
            $topShops = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if(!empty($topShops)){
                return $topShops;
            }
            return false;
        }
    }
}