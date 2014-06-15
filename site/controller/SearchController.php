<?php

    require_once WWW_ROOT . 'controller' . DS . 'AppController.php';

    class SearchController extends AppController
    {

        public function __construct(){
            parent::__construct();

            require_once WWW_ROOT . 'dao' . DS . 'SearchDAO.php';
            $this->searchDAO = new SearchDAO();
        }

        public function search(){

        }
    }