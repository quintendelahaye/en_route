<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class Mission4DAO{

    public $pdo;

    public function __construct()
    {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function insertPicture($group_id, $member_id, $image_name){
        $sql = "INSERT INTO enroute_opdracht4(group_id, member_id, image_name)
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
                        FROM enroute_opdracht4";
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

    public function getAllGroupPics(){
        $sql = "SELECT enroute_opdracht4.*, enroute_groups.*
                FROM enroute_opdracht4
                INNER JOIN enroute_groups
                ON enroute_opdracht4.group_id = enroute_groups.id
                ORDER by enroute_groups.created_date DESC";
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


    public function getGroupPictureBySchool($groupids){
        $sql = "SELECT enroute_opdracht4.id, enroute_opdracht4.group_id,enroute_opdracht4.member_id,enroute_opdracht4.image_name,enroute_groups.groupname,enroute_groups.created_date
                FROM enroute_opdracht4
                INNER JOIN enroute_groups
                ON enroute_opdracht4.group_id = enroute_groups.id
                WHERE ";
        $arr_length = count($groupids);
        for ($i = 0; $i < $arr_length; $i++){
            $sql = $sql."enroute_opdracht4.group_id = ".$groupids[$i];
            $hulp = $arr_length-1;
            if ($hulp != $i){
                $sql = $sql." OR ";
            }
        }
            $stmt = $this->pdo->prepare($sql);
            if($stmt->execute()){
                $groupPictures = $stmt->fetchAll(PDO::FETCH_ASSOC);

                if(!empty($groupPictures)){
                    return $groupPictures;
                }
                return false;
            }
        }



    public function getFirstGroupPics($limit){
        $sql = "SELECT enroute_opdracht4.*, enroute_groups.*
                FROM enroute_opdracht4
                INNER JOIN enroute_groups
                ON enroute_opdracht4.group_id = enroute_groups.id
                ORDER by enroute_groups.created_date DESC
                LIMIT :limit";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(':limit', $limit);
        if($stmt->execute()){
            $grouppics = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if(!empty($grouppics)){
                return $grouppics;
            }
            return false;
        }
    }
}