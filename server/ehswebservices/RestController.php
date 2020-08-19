<?php
require_once("EHSUserRestHandler.php");
		
$api = "";
if(isset($_GET["api"]))
	$api = $_GET["api"];
/*
controls the RESTful services
URL mapping
*/

switch($api){

	case "getEhsUsers":
		// to handle REST Url /FBUser/list/
		$EHSUserRestHandler = new EHSUserRestHandler();
		$EHSUserRestHandler->getEHSUsers();
		break;
		
	case "getEhsTechUsers":
	    // to handle REST Url /FBUser/list/
	    $EHSUserRestHandler = new EHSUserRestHandler();
	    $EHSUserRestHandler->getEHSTechUsers();
	    break;
	    
	case "single":
	    echo "single ";
		// to handle REST Url /FBUser/show/<id>/
		$EHSUsersRestHandler = new EHSUserRestHandler();
		$EHSUsersRestHandler->getUser($_GET["id"]);
		break;

	case "" :
		//404 - not found;
	    echo "API not found ";
		break;
}
?>