<?php

require_once("EHSBaseRest.php");
require_once("FbUser.php");
require_once("FbUserDao.php");


class EHSUserRestHandler extends EHSBaseRest {
	
	public function getUser($id) {

	    echo "mc test getUser(id) ";
	    
		$User = new FbUser();
		$rawData = $User->getUser($id);

		if(empty($rawData)) {
			$statusCode = 404;
			$rawData = array('error' => 'No Users found!');
		} else {
			$statusCode = 200;
		}

		$requestContentType = $_SERVER['HTTP_ACCEPT'];
		$this ->setHttpHeaders($requestContentType, $statusCode);
				
		echo "get all fb users";
		
		if(strpos($requestContentType,'application/json') !== false){
			$response = $this->encodeJson($rawData);
			echo $response;
		} else if(strpos($requestContentType,'text/html') !== false){
			$response = $this->encodeHtml($rawData);
			echo $response;
		} else if(strpos($requestContentType,'application/xml') !== false){
			$response = $this->encodeXml($rawData);
			echo $response;
		}
	}
	
	public function getEHSUsers() {
	    
	    $user = new FbUserDao();

	    $rawData = $user->getEHSUsers();
	    
	    if(empty($rawData)) {
	        $statusCode = 404;
	        $rawData = array('error' => 'No Users found!');
	    } else {
	        $statusCode = 200;
	    }
	    
	    var_dump($rawData);
	    
	    //echo json_encode($rawData);
	    
	    // massage all the users into FbUsers array
	    
	    //ehco $_SERVER['HTTP_ACCEPT'];
	    
	    /*
	     $requestContentType = $_SERVER['HTTP_ACCEPT'];
	     $this ->setHttpHeaders($requestContentType, $statusCode);
	     
	     
	     if(strpos($requestContentType,'application/json') !== false){
	     $response = $this->encodeJson($rawData);
	     echo $response;
	     } else if(strpos($requestContentType,'text/html') !== false){
	     $response = $this->encodeHtml($rawData);
	     echo $response;
	     } else if(strpos($requestContentType,'application/xml') !== false){
	     $response = $this->encodeXml($rawData);
	     echo $response;
	     }*/
	    
	}
	
	public function getEHSTechUsers() {
	    
	    $user = new FbUserDao();
	    $rawData = $user->getEHTechSUsers();
	    
	    if(empty($rawData)) {
	        $statusCode = 404;
	        $rawData = array('error' => 'No Users found!');
	    } else {
	        $statusCode = 200;
	    }

	    //$requestContentType = "'application/json'";    // $_SERVER['HTTP_ACCEPT'];
	    //$this ->setHttpHeaders($requestContentType, $statusCode);
	    
	    var_dump($rawData);
	    
	    /*
	    if(strpos($requestContentType,'application/json') !== false){
	        $response = $this->encodeJson($rawData);
	        echo "here 1";
	        echo $response;
	    } else if(strpos($requestContentType,'text/html') !== false){
	        $response = $this->encodeHtml($rawData);
	        echo "here 2";
	        echo $response;
	    } else if(strpos($requestContentType,'application/xml') !== false){
	        echo "here 3";
	        $response = $this->encodeXml($rawData);
	        echo $response;
	    }
	    */


	    
	    //foreach($rawData as $key => $value)
	    //    print($rawData[$key] . "\n"); 
	    
	    //echo json_encode($rawData);
	    //json_encode($rawData);
	    
	    /*
	     $requestContentType = $_SERVER['HTTP_ACCEPT'];
	     $this ->setHttpHeaders($requestContentType, $statusCode);
	     
	     
	     if(strpos($requestContentType,'application/json') !== false){
	     $response = $this->encodeJson($rawData);
	     echo $response;
	     } else if(strpos($requestContentType,'text/html') !== false){
	     $response = $this->encodeHtml($rawData);
	     echo $response;
	     } else if(strpos($requestContentType,'application/xml') !== false){
	     $response = $this->encodeXml($rawData);
	     echo $response;
	     }*/

	}
	
	public function encodeHtml($responseData) {
	
		$htmlResponse = "<table border='1'>";
		foreach($responseData as $key=>$value) {
    			$htmlResponse .= "<tr><td>". $key. "</td><td>". $value. "</td></tr>";
		}
		$htmlResponse .= "</table>";
		return $htmlResponse;		
	}
	
	public function encodeJson($responseData) {
		$jsonResponse = json_encode($responseData);
		return $jsonResponse;		
	}
	
	public function encodeXml($responseData) {
		// creating object of SimpleXMLElement
		$xml = new SimpleXMLElement('<?xml version="1.0"?><User></User>');
		foreach($responseData as $key=>$value) {
			$xml->addChild($key, $value);
		}
		return $xml->asXML();
	}

}
?>