<?php
/* 
A domain Class to demonstrate EHS RESTful web services
*/
Class FbUsers {
	
	private $fbusers = array(
		1 => 'Ming Chen',  
		2 => 'Sam Leung',  
		3 => 'H Le',  			
		4 => 'John Vu',  			
		5 => 'Ann Bui',  
		6 => 'Armstrong Kuo');
		
	/*
		you should hookup the DAO here
	*/
	public function getAllFbUsers(){
		return $this->fbusers;
	}
	
	public function getFbUser($id){
		
		$user = array($id => ($this->fbusers[$id]) ? $this->fbusers[$id] : $this->fbusers[1]);
		return $user;
	}	
}
?>