<?php 

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class MissionsDAO{

	public $pdo;

	public function __construct()
	{
		$this->pdo = DatabasePDO::getInstance();
	}

	public function getMissions(){
		$sql = "SELECT *
				FROM enroute_opdrachten";
        $stmt = $this->pdo->prepare($sql);
         if($stmt->execute()){
             $missions = $stmt->fetchAll(PDO::FETCH_ASSOC);
             if(!empty($missions)){
                 return $missions;
             }
         }
         return false;
	}
}