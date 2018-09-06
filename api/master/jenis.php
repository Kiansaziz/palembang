<?php
require('../connection.php');
require_once('../vendor/autoload.php');
use \Firebas\JWT\JWT;
define('SECRET_KEY','Kians-Azizatikarna');
define('ALGORITHM','HS512');
$secretKey = base64_decode(SECRET_KEY);
$type = $conn->real_escape_string(htmlentities($_GET['type']));


if ($type == 'dataJenis') 
{
	$proses = $conn->query("SELECT * FROM tbl_jenis_pekerjaan");
	if ($proses->num_rows > 0) {
			while($rs = $proses->fetch_object()){
				$outpArr[] = $rs;
			}
		}	else{
			$outpArr=null;
		}
		echo json_encode($outpArr);
}

if($type == 'dataJenisDetail')
{
  $post             = json_decode(file_get_contents("php://input"));
  $id 			    = $conn->real_escape_string($post->id);
  $proses           = $conn->query("SELECT * FROM tbl_jenis_pekerjaan WHERE id = '$id'");
  if ($proses->num_rows > 0) {
    while($rs = $proses->fetch_object()) {
        $outp = $rs;
    }
  } else {
    $outp=null;
  }
  echo json_encode($outp);
}

if ($type == 'insert') {
  $post     = json_decode(file_get_contents("php://input"));
  $jenisPekerjaan    = $conn->real_escape_string(isset($post->jenisPekerjaan)?$post->jenisPekerjaan : '');
  $query    = "INSERT INTO tbl_jenis_pekerjaan (jenisPekerjaan) VALUES ('$jenisPekerjaan')";
  $runQuery = $conn->query($query);
  if ($runQuery) {
    $outp .= '{"status":"success",';
    $outp .= '"keterangan":"Berhasil Memasukan Data"}';
  } else {
    $outp .= '{"status":"error",';
    $outp .= '"keterangan":"Gagal Memasukan Data"}';
  }
  echo $outp;
}




if ($type == 'update') {
  $post     = json_decode(file_get_contents("php://input"));
  $id       = $conn->real_escape_string(isset($post->id) ? $post->id : '');
  $jenisPekerjaan     = $conn->real_escape_string(isset($post->jenisPekerjaan) ? $post->jenisPekerjaan : '');
  $query = "UPDATE tbl_jenis_pekerjaan SET jenisPekerjaan = '$jenisPekerjaan' WHERE id = '$id'";
  $runQuery = $conn->query($query);
  if ($runQuery) {
    $outp .= '{"status":"success",';
    $outp .= '"keterangan":"Berhasil Mengubah Data"}';
  } else {
    $outp .= '{"status":"error",';
    $outp .= '"keterangan":"Gagal Mengubah Data"}';
  }
  echo $outp;
}

if ($type == 'delete') {
  $post        = json_decode(file_get_contents("php://input"));
  $id          = $conn->real_escape_string(isset($post->id) ? $post->id : '');
  $query      = "DELETE FROM tbl_jenis_pekerjaan WHERE id = '$id'";
  if ($conn->query($query)) {
    $outp .= '{"status":"success",';
    $outp .= '"keterangan":"Berhasil Menghapus Data"}';
  } else {
    $outp .= '{"status":"error",';
    $outp .= '"keterangan":"Gagal Menghapus Data"}';
  }
  echo $outp;
}


?>