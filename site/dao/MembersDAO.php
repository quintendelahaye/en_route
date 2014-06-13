<?php 

//require_once '../classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';
require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class MembersDAO{

	public $pdo;

	public function __construct()
	{
		$this->pdo = DatabasePDO::getInstance();
	}

	public function getMembers($group_id){
		$sql = "SELECT *
				FROM enroute_members
				WHERE group_id = :group_id";				
		$stmt = $this->pdo->prepare($sql);
		$stmt->bindValue(":group_id", $group_id);		
		if($stmt->execute()){
			$members = $stmt->fetchAll(PDO::FETCH_ASSOC);
			if(!empty($members)){
				return $members;
			}
		}
		return array();
	}

	public function insertMember($member_name,$group_id){
		$sql = "INSERT INTO enroute_members(group_id, member_name)
				VALUES (:group_id,:member_name)";
		$stmt = $this->pdo->prepare($sql);
		$stmt->bindValue(":group_id",$group_id);
        $stmt->bindValue(":member_name",$member_name);
		if($stmt->execute()){
			return true;
		}else{
			return false;
		}
	}

	public function getMember($id){
		$sql = "SELECT * 
				FROM enroute_members
				WHERE id = :id";
		$stmt = $this->pdo->prepare($sql);
		$stmt->bindValue(':id', $id);
		if($stmt->execute()){
			$member = $stmt->fetch(PDO::FETCH_ASSOC);
			if(!empty($member)){
				return $member;
			}
		}
		return array();
	}

}