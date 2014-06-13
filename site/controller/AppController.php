<?php

    class AppController
    {
        public $route = array();
        public $viewVars = array();

        public function __construct()
        {
        }

        public function filter()
        {

            call_user_func(array($this, $this->route['action']));

            $activeItem = $this->route['action'];
            $this->set('activeItem', $activeItem);
        }

        public function render()
        {
            extract($this->viewVars, EXTR_OVERWRITE);
            require WWW_ROOT . 'parts/header.php';
            require WWW_ROOT . 'pages/' . strtolower($this->route['controller']) . '/' . $this->route['action'] . '.php';
            require WWW_ROOT . 'parts/footer.php';
            unset($_SESSION["errors"]);
        }

        public function set($variableName, $value)
        {
            $this->viewVars[$variableName] = $value;
        }

        public function addError($error)
        {
            if(!isset($_SESSION["errors"]))
            {
                $_SESSION["errors"] = array();
            }

            $_SESSION["errors"][] = $error;
        }

        public function redirect($url)
        {
            header("Location: {$url}");
            exit();
        }
    }