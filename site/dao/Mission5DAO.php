<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class Mission5DAO{

    public $pdo;

    public function __construct()
    {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function insertPicture($group_id, $member_id, $image_name){
        $sql = "INSERT INTO enroute_opdracht5(group_id, member_id, image_name)
                VALUES (:group_id,:member_id,:image_name)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(":group_id",$group_id);
        $stmt->bindValue(":member_id",$member_id);
        $stmt->bindValue(":image_name",$image_name);
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }

    public function getPicturesByAmount()
    {
        $sql = "SELECT id, COUNT(*) AS NumberOfPictures
                        FROM enroute_opdracht5";
        $stmt = $this->pdo->prepare($sql);
        if($stmt->execute())
        {
            $pictures = $stmt->fetch(PDO::FETCH_ASSOC);
            if(!empty($pictures))
            {
                return $pictures;
            }
        }
        return false;
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