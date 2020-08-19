<?php
/* 
A domain Class to demonstrate EHS RESTful web services
*/

require_once("FbUser.php");


Class FbUserDao {
	
	private $EhsUsers = array();
	private $EhsTechUsers = array();
	
	private $serverName = "W1KS76410E3\SQLEXPRESSCH2"; //serverName\instanceName localhost
	//private $serverName = "2620:10d:c081:10::50"; //serverName\instanceName
	
	// If UID and PWD are not specified in the $connectionInfo array,
	// The connection will be attempted using Windows Authentication.
	
	/*
	// local user login
	private $username = "sa";
	private $password = "fAcEHS3b00k423$";
	*/
	
	// ASH server login:
	private $username = "ehs";
	private $password = "fAcEhS9c06k4m23$";
	
	private $connectionInfo;
	private $conn;
	
	private function openConnection(){
	    $this->connectionInfo = array( "Database"=>"EHSMetrics", "UID" => $this->username, "PWD" => $this->password);
	    $this->conn = sqlsrv_connect( $this->serverName, $this->connectionInfo);
	    
	    if( $this->conn ) {
	        echo "Connection established to ASH server!!!";
	        echo("<br/>");
	    }else{
	        echo "Connection could not be established<br>";
	        die( print_r( sqlsrv_errors(), true));
	    }
	}
	
	public function getEHSUsers(){
	    $this->openConnection();
	    
	    $tsql = "SELECT [UserId], [FBUserName], [EmpName], [FBFunc], [LastLogin] FROM dbo.FB_USERS where Status = 'Active' and FBFunc in ('EHS Only','Super User') ";
	    $UserStatement = sqlsrv_query($this->conn, $tsql);
	    
	    if ($UserStatement == FALSE)
	        die(FormatErrors(sqlsrv_errors()));
	        $userCount = 0;
	        
	        while($row = sqlsrv_fetch_array($UserStatement, SQLSRV_FETCH_ASSOC))
	        {
	            $dateLastLogin = $row['LastLogin'];
	            $userCount++;
	            
	            $user = new FbUser();
	            $user->setId( $row['UserId'] );
	            $user->setName( $row['EmpName'] );
	            $user->setFBFunc( $row['FBFunc'] );
	            $user->setLoginName( $row['FBUserName'] );
	            $user->setLastLoginDate( $dateLastLogin );
	            
	            array_push( $this->EhsUsers, $user );
	        }
	        
	        echo("Total head count from EHS Users: " . $userCount . ".    ");
	        
	        sqlsrv_free_stmt($UserStatement);
	        
	        // Close the connection.
	        sqlsrv_close( $this->conn );
	        //echo "connection closed!</br>";
	        
	        return $this->EhsUsers;
	}
	
	public function getEHTechSUsers(){
	    $this->openConnection();
	    
	    $tsql = "SELECT [UserId], [FBUserName], [EmpName], [FBFunc], [LastLogin] FROM dbo.FB_USERS where Status = 'Active' and FBFunc in ('Super User') ";
	    $UserStatement = sqlsrv_query($this->conn, $tsql);
	    
	    if ($UserStatement == FALSE)
	        die(FormatErrors(sqlsrv_errors()));
	        $userCount = 0;
	        
	        while($row = sqlsrv_fetch_array($UserStatement, SQLSRV_FETCH_ASSOC))
	        {
	            $dateLastLogin = $row['LastLogin'];
	            
	            if( $dateLastLogin != FALSE ){
	                // echo($dateLastLogin->format('Y-m-d H:i:s'));
	            }
	            else{
	                // echo("No valid login time");
	            }
	            $userCount++;
	            
	            $user = new FbUser();
	            $user->setId( $row['UserId'] );
	            $user->setName( $row['EmpName'] );
	            $user->setFBFunc( $row['FBFunc'] );
	            $user->setLoginName( $row['FBUserName'] );
	            $user->setLastLoginDate( $dateLastLogin );
	            
	            array_push( $this->EhsTechUsers, $user );
	        }
	        
	        echo("Total head count from EHS tech Users: " . $userCount . ".    ");
	        
	        sqlsrv_free_stmt($UserStatement);
	        
	        
	        // Close the connection.
	        sqlsrv_close( $this->conn );
	        //echo "connection closed!</br>";
	        
	        return $this->EhsTechUsers;
	}

	public function getFbUser($id){	
		$user = array($id => ($this->fbusers[$id]) ? $this->fbusers[$id] : $this->fbusers[1]);
		return $user;
	}	
}
?>