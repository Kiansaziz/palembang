<?php

	if(!empty($_FILES['file']['name'])){
		$count = count($_FILES['file']['name']);
		foreach ($_FILES['file']['name'] as $key => $filename){
			$newFilename = time() . "_" . $filename;

			$path = 'upload/' . $newFilename;

			if(move_uploaded_file($_FILES['file']['tmp_name'][$key], $path)){
				$sql = "INSERT INTO upload (filename) VALUES ('$newFilename')";
				$query=$conn->query($sql);
			}
			 	
			if($query){
				if($count > 1){
					$out['message'] = 'Files Uploaded Successfully';
				}
				else{
					$out['message'] = 'File Uploaded Successfully';
				}
				
			}
			else{
				$out['error'] = true;
				$out['message'] = 'File Uploaded but not Saved';
			}
		
		}
	}
	else{
		$out['error'] = true;
		$out['message'] = 'Upload Failed. File empty!';
	}

	echo json_encode($out);
?>

