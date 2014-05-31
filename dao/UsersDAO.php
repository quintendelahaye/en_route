<?php 

require_once '../classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class UsersDAO{

	public $pdo;

	public function __construct()
	{
		$this->pdo = DatabasePDO::getInstance();
	}

	public function getUsers(){
		$sql = "SELECT *
				FROM enroute_users";
		$stmt = $this->pdo->prepare($sql);
		if($stmt->execute()){
			$users = $stmt->fetchAll(PDO::FETCH_ASSOC);
			if(!empty($users)){
				return $users;
			}
		}
		return array();		
	}

}