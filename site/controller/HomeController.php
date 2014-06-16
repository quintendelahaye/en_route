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

        public function home()
        {
            $collagepictures = $this->mission1DAO->getFirstPicturesAndGroupNames(4);
            $this->set("collagepictures", $collagepictures);

            $soundsAndBgs = $this->mission2DAO->getFirstSoundsAndPictures(4);
            $this->set("soundsAndBgs", $soundsAndBgs);

            $topShops = $this->mission3DAO->getTop3Shops();
            $this->set("topShops", $topShops);

            $grouppics = $this->mission4DAO->getFirstGroupPics(4);
            $this->set("grouppics", $grouppics);

            $vintagepics = $this->mission5DAO->getFirstVintagePics(4);
            $this->set("vintagepics", $vintagepics);
        }
    }