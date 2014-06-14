<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class Mission6DAO{

    public $pdo;

    public function __construct()
    {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function getAllPics(){
        $sql = "SELECT enroute_opdracht6.*, enroute_groups.*
                FROM enroute_opdracht6
                INNER JOIN enroute_groups
                ON enroute_opdracht6.group_id = enroute_groups.id";
        $stmt = $this->pdo->prepare($sql);
        if($stmt->execute()){
            $oldvsnewpics = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if(!empty($oldvsnewpics)){
                return $oldvsnewpics;
            }
            return false;
        }
    }

    public function getAllPicsByPictureId($id){
        $sql = "SELECT enroute_opdracht6.*, enroute_groups.*
                FROM enroute_opdracht6
                INNER JOIN enroute_groups
                ON enroute_opdracht6.group_id = enroute_groups.id
                WHERE enroute_opdracht6.group_id = :id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(':id', $id);
        if($stmt->execute()){
            $collage = $stmt->fetch(PDO::FETCH_ASSOC);

            if(!empty($collage)){
                return $collage;
            }
            return false;
        }
    }
}