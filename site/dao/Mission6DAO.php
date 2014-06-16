<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class Mission6DAO{

    public $pdo;

    public function __construct()
    {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function insertPicture($group_id, $member_id, $image_name, $new){
        $sql = "INSERT INTO enroute_opdracht6(group_id, member_id, image_name, new)
                VALUES (:group_id,:member_id,:image_name, :new)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(":group_id",$group_id);
        $stmt->bindValue(":member_id",$member_id);
        $stmt->bindValue(":image_name",$image_name);
        $stmt->bindValue(":new",$new);
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }

    public function getPicturesByAmount()
    {
        $sql = "SELECT id, COUNT(*) AS NumberOfPictures
                        FROM enroute_opdracht6";
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

    public function getAllPics(){
        $sql = "SELECT enroute_opdracht6.id, enroute_opdracht6.group_id,enroute_opdracht6.member_id,enroute_opdracht6.image_name,enroute_groups.groupname,enroute_groups.created_date
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
                WHERE enroute_opdracht6.id = :id";
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

    public function getAllPicsBySchool($groupids){
       $sql = "SELECT enroute_opdracht6.id, enroute_opdracht6.group_id,enroute_opdracht6.member_id,enroute_opdracht6.image_name,enroute_groups.groupname,enroute_groups.created_date
               FROM enroute_opdracht6
               INNER JOIN enroute_groups
               ON enroute_opdracht6.group_id = enroute_groups.id
               WHERE ";
       $arr_length = count($groupids);
       for ($i = 0; $i < $arr_length; $i++){
           $sql = $sql."enroute_opdracht6.group_id = ".$groupids[$i];
           $hulp = $arr_length-1;
           if ($hulp != $i){
               $sql = $sql." OR ";
           }
       }
           $stmt = $this->pdo->prepare($sql);
           if($stmt->execute()){
               $foetsiepics = $stmt->fetchAll(PDO::FETCH_ASSOC);
               if(!empty($foetsiepics)){
                   return $foetsiepics;
               }
               return false;
           }
       }
}