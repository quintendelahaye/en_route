<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class Mission4DAO{

    public $pdo;

    public function __construct()
    {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function getAllGroupPics(){
        $sql = "SELECT enroute_opdracht4.*, enroute_groups.*
                FROM enroute_opdracht4
                INNER JOIN enroute_groups
                ON enroute_opdracht4.group_id = enroute_groups.id";
        $stmt = $this->pdo->prepare($sql);
        if($stmt->execute()){
            $grouppics = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if(!empty($grouppics)){
                return $grouppics;
            }
            return false;
        }
    }

    public function getGroupPicByGroup($id){
        $sql = "SELECT enroute_opdracht4.*, enroute_groups.*
                FROM enroute_opdracht4
                INNER JOIN enroute_groups
                ON enroute_opdracht4.group_id = enroute_groups.id
                WHERE enroute_opdracht4.group_id = :id";
        $stmt = $this->pdo->prepare($sql);
       $stmt->bindValue(':id', $id);
       if($stmt->execute())
       {
           $group = $stmt->fetch(PDO::FETCH_ASSOC);

           if(!empty($group))
           {
               return $group;
           }
           return false;
       }
    }
}