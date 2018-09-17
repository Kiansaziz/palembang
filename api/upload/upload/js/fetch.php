<?php
	$conn = new mysqli('localhost', 'root', '', 'multi');
	$output = array();
	$sql = "SELECT * FROM files";
	$query=$conn->query($sql);
	while($row=$query->fetch_array()){
		$output[] = $row;
	}

	echo json_encode($output);
?>