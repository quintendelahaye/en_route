<?php

    require_once WWW_ROOT . 'controller' . DS . 'AppController.php';

    class SubscribeController extends AppController
    {
        public $shopOpen;

        public function __construct()
        {
            parent::__construct();

            require_once WWW_ROOT . 'dao' . DS . 'GroupsDAO.php';
            $this->groupsDAO = new GroupsDAO();
        }

        public function subscribe(){
            $txtGroup = "";
            $txtEmail = "";
            $txtName = "";
            $txtDate = date("n/j/y");
            $arrErrors = array();
            $added = false;

            if(!empty($_POST["btnSubscribe"]) && strtolower($_POST["btnSubscribe"]) == "inschrijven"){

                if(!empty($_POST['txtGroup']) && $_POST["txtGroup"]){
                    $txtGroup = $_POST['txtGroup'];
                }
                else{
                    $arrErrors['txtGroup'] = 'Vul een groep in';
                }
                if(!empty($_POST['txtEmail']) && $_POST["txtEmail"]){
                    $txtEmail = $_POST['txtEmail'];
                }
                else{
                    $arrErrors['txtEmail'] = 'Vul een e-mailadres in';
                }
                if(!empty($_POST['txtName']) && $_POST["txtName"]){
                    $txtName = $_POST['txtName'];
                }
                else{
                    $arrErrors['txtName'] = 'Vul een naam in';
                }

                if(!empty($_POST['txtDate']) && $_POST["txtDate"] && $_POST["txtDate"] > date("Y-m-d")){
                    $dates = $this->groupsDAO->getAllChosenDates();
                    foreach ($dates as $key => $date) {
                        if (date_format(new DateTime($date["visited"]), "Y-m-d") == $_POST['txtDate']) {
                            $arrErrors['txtDate'] = 'Datum al ingenomen';
                        }
                        $txtDate = $_POST['txtDate'];
                    }
                }
                else{
                    $arrErrors['txtDate'] = 'Vul een datum in';
                }
                if(empty($arrErrors)){
                    $this->groupsDAO->insertNewSchoolOrGroup($_POST["txtGroup"],$_POST["txtEmail"], $_POST["txtName"], date("Y-m-d H:i:s",strtotime($_POST['txtDate'])));
                    $added = true;
                }
            }

            $dates = $this->groupsDAO->getAllChosenDates();
            $this->set('dates', $dates);

            $this->set('txtGroup', $txtGroup);
            $this->set('txtEmail', $txtEmail);
            $this->set('txtName', $txtName);
            $this->set('txtDate', $txtDate);
            $this->set('added', $added);

            $this->set('arrErrors', $arrErrors);
        }
    }