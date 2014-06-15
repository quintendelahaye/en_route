<?php

    require_once WWW_ROOT . 'controller' . DS . 'AppController.php';

    class WorksController extends AppController
    {
        public $shopOpen;

        public function __construct()
        {
            parent::__construct();

            require_once WWW_ROOT . 'dao' . DS . 'MissionsDAO.php';
            $this->missionsDAO = new MissionsDAO();

            require_once WWW_ROOT . 'dao' . DS . 'Mission1DAO.php';
            $this->mission1DAO = new Mission1DAO();

            require_once WWW_ROOT . 'dao' . DS . 'Mission2DAO.php';
            $this->mission2DAO = new Mission2DAO();

            require_once WWW_ROOT . 'dao' . DS . 'Mission3DAO.php';
            $this->mission3DAO = new Mission3DAO();

            require_once WWW_ROOT . 'dao' . DS . 'Mission4DAO.php';
            $this->mission4DAO = new Mission4DAO();

            require_once WWW_ROOT . 'dao' . DS . 'Mission5DAO.php';
            $this->mission5DAO = new Mission5DAO();

            require_once WWW_ROOT . 'dao' . DS . 'Mission6DAO.php';
            $this->mission6DAO = new Mission6DAO();

            require_once WWW_ROOT . 'dao' . DS . 'GroupsDAO.php';
            $this->groupsDAO = new GroupsDAO();
        }

        public function works()
        {
            $activeMission = "";
            $mission = "";
            $title = "";

            $schools = $this->groupsDAO->getAllSchools();
            $this->set("schools", $schools);

            $missions = $this->missionsDAO->getMissions();
            $this->set("missions", $missions);

            //mission1------------------------------
            $mission1 = false;
            $mission2 = false;
            $mission3 = false;
            $mission4 = false;
            $mission5 = false;
            $mission6 = false;
            $collage = "";
            $group = "";
            $oldvsnew = "";

            if(!empty($_GET["mission"]))
            {
                $mission = $_GET["mission"];
                $activeMission = $mission;
                if($activeMission == 1){
                    $title = "opdracht collage";
                    $mission1 = true;
                    if(!empty($_GET["id"]))
                    {
                        $collage = $this->mission1DAO->getPictureAndGroupNameByPictureId($_GET["id"]);
                    }
                }
                elseif($activeMission == 2){
                    $title = "opdracht dialecten";
                    $mission2 = true;
                }
                elseif($activeMission == 3){
                    $title = "opdracht mode";
                    $mission3 = true;
                }
                elseif($activeMission == 4){
                    $title = "opdracht standbeeld";
                    $mission4 = true;
                    if(!empty($_GET["id"]))
                    {
                        $group = $this->mission4DAO->getGroupPicByGroup($_GET["id"]);
                    }
                }
                elseif($activeMission == 5){
                    $title = "opdracht vintage";
                    $mission5 = true;
                }
                elseif($activeMission == 6){
                    $title = "opdracht verdwijnen";
                    $mission6 = true;
                    if(!empty($_GET["id"])){
                        $oldvsnew = $this->mission6DAO->getAllPicsByPictureId($_GET["id"]);
                    }
                }
                else{
                    $title = "alle werken";
                    $mission1 = true;
                    $mission2 = true;
                    $mission3 = true;
                    $mission4 = true;
                    $mission5 = true;
                    $mission6 = true;
                }
            }
            else{
                $title = "alle werken";
                $mission1 = true;
                $mission2 = true;
                $mission3 = true;
                $mission4 = true;
                $mission5 = true;
                $mission6 = true;
            }

            $this->set("activeMission", $activeMission);
            $this->set("mission", $mission);
            $this->set("title", $title);

            //mission1------------------------------
            $collagepictures = $this->mission1DAO->getPicturesAndGroupNames();
            $this->set("collagepictures", $collagepictures);

            //mission2------------------------------
            $soundsAndBgs = $this->mission2DAO->getAllSoundsAndPictures();
            $this->set("soundsAndBgs", $soundsAndBgs);

            $sounds = $this->mission2DAO->getAllSounds();
            $this->set("sounds", $sounds);

            //mission3------------------------------
            $topShops = $this->mission3DAO->getTop3Shops();
            $this->set("topShops", $topShops);

            $shops = $this->mission3DAO->getAllShopsAndAmount();
            $this->set("shops", $shops);

            //mission4------------------------------
            $grouppics = $this->mission4DAO->getAllGroupPics();
            $this->set("grouppics", $grouppics);

            //mission5------------------------------
            $vintagepics = $this->mission5DAO->getAllVintagePics();
            $this->set("vintagepics", $vintagepics);

            //mission6------------------------------
            $oldvsnewpics = $this->mission6DAO->getAllPics();
            $this->set("oldvsnewpics", $oldvsnewpics);

            $this->set("mission1", $mission1);
            $this->set("mission2", $mission2);
            $this->set("mission3", $mission3);
            $this->set("mission4", $mission4);
            $this->set("mission5", $mission5);
            $this->set("mission6", $mission6);

            $this->set("collage", $collage);
            $this->set("group", $group);
            $this->set("oldvsnew", $oldvsnew);
        }

        public function detail(){
            if(empty($_GET['id'])) {
                $this->redirect("index.php");
            }

            $school = $this->groupsDAO->getSchoolById($_GET['id']);
            if(empty($school)) {
                $this->addError("Ongeldige post!");
                $this->redirect("index.php");
            }
            $this->set('school', $school);

            $arrGroups = array();

            $groups = $this->groupsDAO->getGroupsBySchool($school["visited"]);
            $this->set('groups', $groups);

            foreach($groups as $group){
                array_push($arrGroups, $group["id"]);
            }

            if(!empty($_GET['team'])) {
                $members = $this->groupsDAO->getMembersByGroupId($_GET["team"]);
                $this->set('members', $members);
            }

            $mission1 = false;
            $collage = "";

            if(!empty($_GET["mission"]))
            {
                if($_GET["mission"] == 1){
                    $mission1 = true;
                    if(!empty($_GET["picid"]))
                    {
                        $collage = $this->mission1DAO->getPictureAndGroupNameByPictureId($_GET["picid"]);
                    }
                }
            }

            $mission1Collages = $this->mission1DAO->getPictureAndGroupNameBySchool($arrGroups);
            $this->set('mission1Collages', $mission1Collages);

            $mission2Sounds = $this->mission2DAO->getPictureAndGroupNameBySchool($arrGroups);
            $this->set('mission2Sounds', $mission2Sounds);

            $mission3Shops = $this->mission3DAO->getTop3Shops();
            $this->set("mission3Shops", $mission3Shops);

            $shopsByGroup = $this->mission3DAO->getAllShopsAndAmountByGroup($_GET['id']);
            $this->set("shopsByGroup", $shopsByGroup);

            $this->set('arrGroups', $arrGroups);

            $this->set("mission1", $mission1);
            $this->set("collage", $collage);
        }
    }