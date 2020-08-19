<?php
/* 
A domain Class to demonstrate EHS RESTful web services
*/

Class FbUser {
	
	// Properties
	private $id;
	private $EmpName;
	private $LoginName;
	private $LastLogin;
	private $FBFunc;
	
	// Methods
	function setName($name) {
		$this->EmpName = $name;
	}
	
	function setId($id) {
		$this->id = $id;
	}
	
	function setLoginName($name) {
		$this->LoginName = $name;
	}
	
	function setLastLoginDate($date) {
		$this->LastLogin = $date;
	}

	function setFBFunc($func) {
		$this->FBFunc = $func;
	}
	
	function get_LoginName() {
		return $this->LoginName;
	}

	function get_EmpName() {
	    return $this->EmpName;
	}
	
	function get_FbFunc() {
	    return $this->FBFunc;
	}
}
?>