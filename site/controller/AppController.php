<?php

    class AppController
    {
        public $route = array();
        public $viewVars = array();

        public function __construct(){
            require_once WWW_ROOT . 'dao' . DS . 'SearchDAO.php';
            $this->searchDAO = new SearchDAO();
        }

        public function filter(){

            $this->searchSchool();

            call_user_func(array($this, $this->route['action']));

            $activeItem = $this->route['action'];
            $this->set('activeItem', $activeItem);
        }

        public function searchSchool(){
            $searchItem = "";
            $schools = array();

            if(!empty($_POST) && !empty($_POST["txtSearch"])){
                $searchItem = $_POST["txtSearch"];
                $schools = $this->searchDAO->searchSchools($searchItem);
            }
            $this->set('schools', $schools);
            $this->set('searchItem', $searchItem);
        }

        public function render(){
            extract($this->viewVars, EXTR_OVERWRITE);

            //AJAX
            if(!empty($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) == "xmlhttprequest")
            {
                require WWW_ROOT . 'pages/' . strtolower($this->route['controller']) . '/' . $this->route['action'] . '.php';
                unset($_SESSION["errors"]);
                exit();
            }

            require WWW_ROOT . 'parts/header.php';
            require WWW_ROOT . 'pages/' . strtolower($this->route['controller']) . '/' . $this->route['action'] . '.php';
            require WWW_ROOT . 'parts/footer.php';
            unset($_SESSION["errors"]);
        }

        public function set($variableName, $value){
            $this->viewVars[$variableName] = $value;
        }

        public function addError($error){
            if(!isset($_SESSION["errors"]))
            {
                $_SESSION["errors"] = array();
            }

            $_SESSION["errors"][] = $error;
        }

        public function redirect($url){
            header("Location: {$url}");
            exit();
        }
    }