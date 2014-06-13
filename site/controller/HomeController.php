<?php

    require_once WWW_ROOT . 'controller' . DS . 'AppController.php';

    class HomeController extends AppController
    {
        public $shopOpen;

        public function __construct()
        {
            parent::__construct();

            require_once WWW_ROOT . 'dao' . DS . 'Mission1DAO.php';
            $this->mission1DAO = new Mission1DAO();
        }

        public function home()
        {
            $collagepictures = $this->mission1DAO->getPicturesAndGroupNames();
            $this->set("collagepictures", $collagepictures);
        }
    }