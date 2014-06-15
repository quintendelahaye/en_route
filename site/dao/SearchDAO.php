<?php 

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class SearchDAO{

	public $pdo;

	public function __construct()
	{
		$this->pdo = DatabasePDO::getInstance();
	}

    public function searchSchools($searchItem){
        $sql = "SELECT * FROM enroute_schools
                where visited <= cast((now()) as date)
                AND school_name LIKE :searchItem
                AND visited <= cast((now() + interval 1 day) as date)";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(':searchItem', "%".$searchItem."%");
         if($stmt->execute()){
             $schools = $stmt->fetchAll(PDO::FETCH_ASSOC);
             if(!empty($schools)){
                 return $schools;
             }
         }
        return array();
    }
}