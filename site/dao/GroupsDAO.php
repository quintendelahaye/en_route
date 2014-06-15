<?php 

//require_once '../classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';
require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

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

	public function insertGroup($groupname,$password){
		$sql = "INSERT INTO enroute_groups(groupname, password, created_date)
				VALUES (:groupname,:password,:created_date)";
		$stmt = $this->pdo->prepare($sql);
		$stmt->bindValue(":groupname",$groupname);
		$securepassword = sha1(CONFIG::SALT.$password);
        $stmt->bindValue(":password",$securepassword);
        $stmt->bindValue(":created_date",date('Y-m-d H:i:s'));
		if($stmt->execute()){
			return $this->getGroup($this->pdo->lastInsertId());
		}
	}

	public function insertUser($groupid,$user){
		$sql = "INSERT INTO enroute_members(group_id, member_name)
				VALUES (:groupid,:user)";
		$stmt = $this->pdo->prepare($sql);
		$stmt->bindValue(":groupid",$groupid);
        $stmt->bindValue(":user",$user);
		if($stmt->execute()){
			return $this->getUser($this->pdo->lastInsertId());
		}
	}

	public function getUser($id){
		$sql = "SELECT * 
				FROM enroute_members
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

	public function getGroup($id){
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

    public function getAllSchools(){
        $sql = "select * from enroute_schools
                where visited <= cast((now()) as date)
                and visited <= cast((now() + interval 1 day) as date);";
        $stmt = $this->pdo->prepare($sql);
         if($stmt->execute()){
             $schools = $stmt->fetchAll(PDO::FETCH_ASSOC);
             if(!empty($schools)){
                 return $schools;
             }
         }
         return false;
    }

    public function getSchoolById($id){
    	$sql = "SELECT * FROM enroute_schools
    			WHERE id = :id";
		$stmt = $this->pdo->prepare($sql);
		$stmt->bindValue(':id', $id);
		if($stmt->execute())
        {
            $school = $stmt->fetch(PDO::FETCH_ASSOC);
            if(!empty($school)){
                return $school;
            }
        }
        return array();
    }

    public function getGroupsBySchool($visited){
        $sql = "SELECT enroute_groups.id,enroute_groups.groupname, enroute_groups.created_date, enroute_schools.school_name, enroute_schools.visited
                FROM enroute_groups
                INNER JOIN enroute_schools
                ON CAST(enroute_groups.created_date AS DATE) = CAST(enroute_schools.visited AS DATE)
                WHERE enroute_schools.visited = :visited";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(':visited', $visited);
        if($stmt->execute()){
          $groups = $stmt->fetchAll(PDO::FETCH_ASSOC);
          if(!empty($groups)){
              return $groups;
          }
        }
        return false;
    }

    public function getMembersByGroupId($group_id){
        $sql = "SELECT enroute_members.group_id, enroute_members.member_name, enroute_groups.id, enroute_groups.groupname
                FROM enroute_members
                INNER JOIN enroute_groups
                ON enroute_members.group_id = enroute_groups.id
                WHERE enroute_members.group_id = :group_id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(':group_id', $group_id);
        if($stmt->execute()){
          $groups = $stmt->fetchAll(PDO::FETCH_ASSOC);
          if(!empty($groups)){
              return $groups;
          }
        }
        return false;
    }
}