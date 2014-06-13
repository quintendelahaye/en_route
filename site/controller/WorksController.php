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
        }

        public function works()
        {
            $activeMission = "";
            $mission = "";
            $title = "";
            $mission1 = false;
            $mission2 = false;
            $mission3 = false;
            $mission4 = false;
            $mission5 = false;
            $mission6 = false;

            $collage = "";

            $missions = $this->missionsDAO->getMissions();
            $this->set("missions", $missions);

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
                }
                elseif($activeMission == 5){
                    $title = "opdracht vintage";
                    $mission5 = true;
                }
                elseif($activeMission == 6){
                    $title = "opdracht verdwijnen";
                    $mission6 = true;
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

            $collagepictures = $this->mission1DAO->getPicturesAndGroupNames();
            $this->set("collagepictures", $collagepictures);

            $this->set("mission1", $mission1);
            $this->set("mission2", $mission2);
            $this->set("mission3", $mission3);
            $this->set("mission4", $mission4);
            $this->set("mission5", $mission5);
            $this->set("mission6", $mission6);

            $this->set("collage", $collage);
        }
    }