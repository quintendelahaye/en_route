<?php
define("WWW_ROOT",dirname(dirname(__FILE__)).DIRECTORY_SEPARATOR);
require_once WWW_ROOT. "dao" .DIRECTORY_SEPARATOR. 'Mission2DAO.php';
$uploaddir = 'mission2/';
$mission2DAO = new Mission2DAO();
//$file is de filename, die maak je door het aantal images op te halen uit de database + 1
for ($i=0; $i < 4; $i++) { 
	if ($i == 0) {
		$file = "image".$_POST["groupid"].".jpg";
		$uploadfile = $uploaddir . $file;

		if (move_uploaded_file($_FILES['userfile']['tmp_name'][$i], $uploadfile)) {
		    echo $file;
		    //nieuwe image updaten in de database
		    $mission2DAO->insertPicture($_POST["groupid"], $_POST["userid"], $file);
		}
		else {
		    echo "error";
		}
	}else{
		if ($i == 1) {
			$sound_name = "schelde".$_POST["groupid"];
			$file = "schelde".$_POST["groupid"].".m4a";
		} elseif ($i == 2) {
			$sound_name = "beiaard".$_POST["groupid"];
			$file = "beiaard".$_POST["groupid"].".m4a";
		} elseif ($i == 3) {
			$sound_name = "bank".$_POST["groupid"];
			$file = "bank".$_POST["groupid"].".m4a";
		}
		$uploadfile = $uploaddir . $file;

		if (move_uploaded_file($_FILES['userfile']['tmp_name'][$i], $uploadfile)) {
		    echo $file;
		    //nieuwe image updaten in de database
		    $mission2DAO->insertSound($_POST["groupid"], $_POST["userid"], $i, $sound_name);
		}
		else {
		   echo "error";
		}
	}
}

require_once 'CloudConvert.class.php';

// insert your API key here
$apikey="UzpmnBnDeiahdjidMpDVOMj8s7HNsZDAEu-EiLb61YlGtl_V3I_QlHMAe21VkVYt1avs7h8Pj21ENVR55tq7eQ";

$process1 = CloudConvert::createProcess("m4a", "mp3", $apikey);
$process2 = CloudConvert::createProcess("m4a", "ogg", $apikey);
$process3 = CloudConvert::createProcess("m4a", "mp3", $apikey);
$process4 = CloudConvert::createProcess("m4a", "ogg", $apikey);
$process5 = CloudConvert::createProcess("m4a", "mp3", $apikey);
$process6 = CloudConvert::createProcess("m4a", "ogg", $apikey);

// set some options here...
// $process -> setOption("email", "1");

$process1-> upload("mission2/schelde".$_POST["groupid"].".m4a", "mp3" );
$process2-> upload("mission2/schelde".$_POST["groupid"].".m4a", "ogg" );
$process3-> upload("mission2/beiaard".$_POST["groupid"].".m4a", "mp3" );
$process4-> upload("mission2/beiaard".$_POST["groupid"].".m4a", "ogg" );
$process5-> upload("mission2/bank".$_POST["groupid"].".m4a", "mp3" );
$process6-> upload("mission2/bank".$_POST["groupid"].".m4a", "ogg" );

if ($process1-> waitForConversion() && $process2-> waitForConversion() && $process3-> waitForConversion() && $process4-> waitForConversion() && $process5-> waitForConversion() && $process6-> waitForConversion()) {
   $process1 -> download("mission2/schelde".$_POST["groupid"].".mp3");
   $process2 -> download("mission2/schelde".$_POST["groupid"].".ogg");
   $process3 -> download("mission2/beiaard".$_POST["groupid"].".mp3");
   $process4 -> download("mission2/beiaard".$_POST["groupid"].".ogg");
   $process5 -> download("mission2/bank".$_POST["groupid"].".mp3");
   $process6 -> download("mission2/bank".$_POST["groupid"].".ogg");
    echo "Conversion done :-)";
} else {
    echo "Something went wrong :-(";
}
?>