<?php 

require_once '../classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class GroupsDAO{

	public $pdo;

	public function __construct()
	{
		$this->pdo = DatabasePDO::getInstance();
	}

	public function getUserByGroupnameAndPassword($groupname, $password){
		$sql = "SELECT *
				FROM enroute_groups
				WHERE groupname = :groupname
				AND password = :password";
		$stmt = $this->pdo->prepare($sql);
		$stmt->bindValue(":groupname",$groupname);
		$securepassword = sha1(CONFIG::SALT.$password);
        $stmt->bindValue(":password",$securepassword);
		if($stmt->execute()){
			$user = $stmt->fetch(PDO::FETCH_ASSOC);
			if(!empty($user)){
				return $user;
			}
		}
		return array();
	}

	public function insertUser($groupname,$password){
		$sql = "INSERT INTO enroute_groups(groupname, password)
				VALUES (:groupname,:password)";
		$stmt = $this->pdo->prepare($sql);
		$stmt->bindValue(":groupname",$groupname);
		$securepassword = sha1(CONFIG::SALT.$password);
        $stmt->bindValue(":password",$securepassword);
		if($stmt->execute()){
			return $this->getUser($this->pdo->lastInsertId());
		}
	}

	public function getUser($id){
		$sql = "SELECT * 
				FROM enroute_groups
				WHERE id = :id";
		$stmt = $this->pdo->prepare($sql);
		$stmt->bindValue(':id', $id);
		if($stmt->execute()){
			$user = $stmt->fetch(PDO::FETCH_ASSOC);
			if(!empty($user)){
				return $user;
			}
		}
		return array();
	}
}