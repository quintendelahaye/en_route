<?php

require_once '../classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class GroentenDAO{

	public $pdo;

	public function __construct()
	{
		$this->pdo = DatabasePDO::getInstance();
	}

	public function getGroenten(){

		$sql = "SELECT * FROM rmd2_groenten";				
		$stmt = $this->pdo->prepare($sql);	
		if($stmt->execute()){
			$groenten = $stmt->fetchAll(PDO::FETCH_ASSOC);
			if(!empty($groenten)){
				return $groenten;
			}
		}
		return array();
	}

	public function insertGroente($moestuin_code,$type){
		$sql = "INSERT INTO `rmd2_groenten`(`moestuin_code`, `type`) 
		VALUES (:moestuin_code,:type)";
		$stmt = $this->pdo->prepare($sql);
		$stmt->bindValue(":moestuin_code",$moestuin_code);
		$stmt->bindValue(":type",$type);
		if($stmt->execute()){
			return $this->getGroente($this->pdo->lastInsertId());
		}
	}

	public function getGroente($id){
		$sql = "SELECT * 
		FROM `rmd2_groenten`
		WHERE id = :id";
		$stmt = $this->pdo->prepare($sql);
		$stmt->bindValue(':id', $id);
		if($stmt->execute()){
			$groente = $stmt->fetch(PDO::FETCH_ASSOC);
			if(!empty($groente)){
				return $groente;
			}
		}
		return array();
	}

	public function deleteGroenteById($id){
		$sql = "DELETE FROM rmd2_groenten
				WHERE id = :id";
		$stmt = $this->pdo->prepare($sql);
		$stmt->bindValue(":id",$id);
		if($stmt->execute()){
			return true;
		}
		return false;
	}

}