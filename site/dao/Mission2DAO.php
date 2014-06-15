<?php

//require_once '../classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';
require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class Mission2DAO{

    public $pdo;

    public function __construct()
    {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function insertPicture($group_id, $member_id, $image_name){
        $sql = "INSERT INTO enroute_opdracht2_bg(group_id, member_id, image_name)
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

    public function insertSound($group_id, $member_id, $word, $sound_name){
        $sql = "INSERT INTO enroute_opdracht2_sound(group_id, member_id, word, sound_name)
                VALUES (:group_id,:member_id,:word, :sound_name)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(":group_id",$group_id);
        $stmt->bindValue(":member_id",$member_id);
        $stmt->bindValue(":word",$word);
        $stmt->bindValue(":sound_name",$sound_name);
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }

    public function getAllSoundsAndPictures(){
        $sql = "SELECT enroute_opdracht2_sound.*, enroute_groups.*
                FROM enroute_opdracht2_sound
                INNER JOIN enroute_groups
                ON enroute_opdracht2_sound.group_id = enroute_groups.id
                GROUP BY enroute_opdracht2_sound.group_id";
        $stmt = $this->pdo->prepare($sql);
        if($stmt->execute()){
            $soundsAndBgs = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if(!empty($soundsAndBgs)){
                return $soundsAndBgs;
            }
            return false;
        }
    }

    public function getAllSounds(){
        $sql = "SELECT *
                FROM enroute_opdracht2_sound";
        $stmt = $this->pdo->prepare($sql);
        if($stmt->execute()){
            $sounds = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if(!empty($sounds)){
                return $sounds;
            }
            return false;
        }
    }

    public function getPictureAndGroupNameBySchool($groupids){
        $sql = "SELECT enroute_opdracht2_sound.*, enroute_groups.*
                FROM enroute_opdracht2_sound
                INNER JOIN enroute_groups
                ON enroute_opdracht2_sound.group_id = enroute_groups.id
                WHERE ";
    $arr_length = count($groupids);
    for ($i = 0; $i < $arr_length; $i++){
        $sql = $sql."enroute_opdracht2_sound.group_id = ".$groupids[$i];
        $hulp = $arr_length-1;
        if ($hulp != $i){
            $sql = $sql." OR ";
        }
    }
        $stmt = $this->pdo->prepare($sql);
        if($stmt->execute()){
            $mission2Sounds = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if(!empty($mission2Sounds)){
                return $mission2Sounds;
            }
            return false;
        }
    }
}