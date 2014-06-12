<?php 

require_once '../classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class Mission1DAO{

    public $pdo;

    public function __construct()
    {
        $this->pdo = DatabasePDO::getInstance();
    }

    public function insertPicture($group_id, $member_id, $image_name){
        $sql = "INSERT INTO enroute_opdracht1(group_id, member_id, image_name)
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
                            FROM enroute_opdracht1";
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
}