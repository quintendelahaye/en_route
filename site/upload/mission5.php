<?php
define("WWW_ROOT",dirname(dirname(__FILE__)).DIRECTORY_SEPARATOR);
require_once WWW_ROOT. "dao" .DIRECTORY_SEPARATOR. 'Mission5DAO.php';
$uploaddir = 'mission5/';
$mission5DAO = new Mission5DAO();
$numberOfPictures = $mission5DAO->getPicturesByAmount();
//$file is de filename, die maak je door het aantal images op te halen uit de database + 1
$getal = $numberOfPictures["NumberOfPictures"]+1;
$file = "image".$getal.".jpg";
$uploadfile = $uploaddir . $file;

echo "file=".$file;

print_r($_POST);

if (move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $uploadfile)) {
    echo $file;
    //nieuwe image updaten in de database
    $mission5DAO->insertPicture($_POST["groupid"], $_POST["userid"], $file);
}
else {
    echo "error";
}
?>