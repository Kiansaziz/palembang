<?php
require('../connection.php');
require_once('../vendor/autoload.php');
use \Firebase\JWT\JWT;
define('SECRET_KEY','Rizki-Fachrulroji');
define('ALGORITHM','HS512');
$secretKey = base64_decode(SECRET_KEY);
$type      = $conn->real_escape_string(htmlentities($_GET['type']));





if($type == 'dataDinas')
{
  $proses = $conn->query("SELECT * FROM tbl_dinas");
  if ($proses->num_rows > 0) {
    while($rs = $proses->fetch_object()) {
        $outpArr[] = $rs;
    }
  } else {
    $outpArr[]=null;
  }
  echo json_encode($outpArr);
}


if ($type == 'insert') {
  $post     = json_decode(file_get_contents("php://input"));
  $dinas    = $conn->real_escape_string(isset($post->dinas)?$post->dinas : '');
  $query    = "INSERT INTO tbl_dinas (dinas) VALUES ('$dinas')";
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


if($type == 'dataDinasDetail')
{
  $post   = json_decode(file_get_contents("php://input"));
  $id     = $conn->real_escape_string($post->id);
  $proses = $conn->query("SELECT * FROM tbl_dinas WHERE id = '$id'");
  if ($proses->num_rows > 0) {
    $outp = $proses->fetch_object();
  } else {
    $outp=null;
  }
  echo json_encode($outp);
}


if ($type == 'update') {
  $post     = json_decode(file_get_contents("php://input"));
  $id       = $conn->real_escape_string(isset($post->id) ? $post->id : '');
  $dinas     = $conn->real_escape_string(isset($post->dinas) ? $post->dinas : '');
  $query = "UPDATE tbl_dinas SET dinas = '$dinas' WHERE id = '$id'";
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
  $query      = "DELETE FROM tbl_dinas WHERE id = '$id'";
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
