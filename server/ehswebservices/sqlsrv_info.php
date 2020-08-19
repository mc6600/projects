<?php
	include 'FbUser.php';

	$serverName = "W1KS76410E3\SQLEXPRESSCH2"; //serverName\instanceName
	//$serverName = "2620:10d:c081:10::50";

	// If UID and PWD are not specified in the $connectionInfo array,
	// The connection will be attempted using Windows Authentication.
	//$username = "sa";
	//$password = "fAcEHS3b00k423$";
	
	// ASH server login:
	$username = "ehs";
	$password = "fAcEhS9c06k4m23$";
	
	$connectionInfo = array( "Database"=>"EHSMetrics", "UID" => $username, "PWD" => $password);
	$conn = sqlsrv_connect( $serverName, $connectionInfo);

	if( $conn ) {
		echo "EHS ash server Connection established!!";
		echo("<br/>");  
	}else{
		echo "Connection could not be established<br>";
		die( print_r( sqlsrv_errors(), true));
	}
   
	$tsql = "SELECT [UserId], [FBUserName], [EmpName], [FBFunc], [LastLogin] FROM dbo.FB_USERS where Status = 'Active' and FBFunc in ('EHS Only', 'Super User') ";  
    $UserStatement = sqlsrv_query($conn, $tsql);  
    if ($UserStatement == FALSE)  
		die(FormatErrors(sqlsrv_errors()));  
    $userCount = 0;  
	
	
	if( $client_info = sqlsrv_client_info( $conn))  
	{  
		echo "Client info: <br/>";
		foreach( $client_info as $key => $value)  
		{  
			echo $key.": ".$value."\n" . "<br/>";  
		}  
	}  
	else  
	{  
		echo "Client info error.\n";  
	}  
  
      
	while($row = sqlsrv_fetch_array($UserStatement, SQLSRV_FETCH_ASSOC))  
	{  
		echo($row['UserId'] . "; " . $row['FBUserName'] . "; " . $row['EmpName'] . "; ");  
		
		$dateLastLogin = $row['LastLogin'];
		
		if( $dateLastLogin != FALSE )
			echo($dateLastLogin->format('Y-m-d H:i:s'));  
		else
			echo("No valid login time");  
		
		echo("<br/>");
		$userCount++;  
	}  
	
	echo("Total head count from FBUsers: " );
	echo($userCount);  
	sqlsrv_free_stmt($UserStatement);  
   
	echo("<br/>");  
	// Close the connection.
	sqlsrv_close( $conn );
	echo "connection closed!";
	
?>
