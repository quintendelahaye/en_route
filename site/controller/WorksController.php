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
        }

        public function works()
        {
            $missions = $this->missionsDAO->getMissions();
            $this->set("missions", $missions);
            trace($missions);
        }
    }