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

if($type == 'dataHistory')
{
  $post             = json_decode(file_get_contents("php://input"));
  $id 			         = $conn->real_escape_string($post->id);
  $proses           = $conn->query("SELECT * FROM tbl_project a 
                          INNER JOIN tbl_user b ON a.idUser=b.id
                          INNER JOIN tbl_kecamatan c ON a.idKec=c.idKec
                          INNER JOIN tbl_kelurahan d ON a.idKel=d.idKel
                          INNER JOIN tbl_dinas e ON a.idDinas=e.id
                          INNER JOIN tbl_jenis_pekerjaan f ON a.idJenisPekerjaan=f.id
                          INNER JOIN tbl_status g ON a.status=g.id WHERE idProject = '$id'");
  if ($proses->num_rows > 0) {
    while($rs = $proses->fetch_object()) {
        $outp = $rs;
    }
  } else {
    $outp=null;
  }
  echo json_encode($outp);
}

if($type == 'dataHistoryDetail')
{
  $post             = json_decode(file_get_contents("php://input"));
  $id                = $conn->real_escape_string($post->id);
  $proses           = $conn->query("SELECT * FROM tbl_project a
                          INNER JOIN tbl_project_history b ON a.idProject = b.idProject 
                          INNER JOIN tbl_user c ON a.idUser=c.id
                          INNER JOIN tbl_kecamatan d ON a.idKec=d.idKec
                          INNER JOIN tbl_kelurahan e ON a.idKel=e.idKel
                          INNER JOIN tbl_dinas f ON a.idDinas=f.id
                          INNER JOIN tbl_jenis_pekerjaan g ON a.idJenisPekerjaan=g.id
                          INNER JOIN tbl_status h ON a.status=h.id WHERE b.idProjectHistory = '$id'");
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


if($type == 'dataHistoryLihat')
{
  $post   = json_decode(file_get_contents("php://input"));
  $id     = $conn->real_escape_string($post->id);
  $proses = $conn->query("SELECT * FROM tbl_project_history a
                          INNER JOIN tbl_project b ON a.idProject=b.idProject 
                          INNER JOIN tbl_user c ON b.idUser=c.id
                          INNER JOIN tbl_kecamatan d ON b.idKec=d.idKec
                          INNER JOIN tbl_kelurahan e ON b.idKel=e.idKel
                          INNER JOIN tbl_dinas f ON b.idDinas=f.id
                          INNER JOIN tbl_jenis_pekerjaan g ON b.idJenisPekerjaan=g.id
                          INNER JOIN tbl_status h ON b.status=h.id 
                          WHERE a.idProject='$id'
                          "
                        );
  if ($proses->num_rows >= 0) {
    while($rs = $proses->fetch_object()) {
      
        $outpArr[] = $rs;
    }
  } else {
    $outpArr[]=null;
  }
  echo json_encode($outpArr);
}



if($type == 'dataProjectDetailHistory')
{
  $post   = json_decode(file_get_contents("php://input"));
  $id     = $conn->real_escape_string($post->id);
  $proses = $conn->query("SELECT * FROM tbl_project_history a
                          INNER JOIN tbl_project b ON a.idProject=b.idProject 
                          INNER JOIN tbl_user c ON b.idUser=c.id
                          INNER JOIN tbl_kecamatan d ON b.idKec=d.idKec
                          INNER JOIN tbl_kelurahan e ON b.idKel=e.idKel
                          INNER JOIN tbl_dinas f ON b.idDinas=f.id
                          INNER JOIN tbl_jenis_pekerjaan g ON b.idJenisPekerjaan=g.id
                          INNER JOIN tbl_status h ON b.status=h.id 
                          WHERE a.idProjectHistory='$id'
                          "
                        );
  if ($proses->num_rows > 0) {
    while($rs = $proses->fetch_object()) {
        $outpArr[] = $rs;
    }
  } else {
    $outpArr[]=null;
  }
  echo json_encode($outpArr);
}



if ($type == 'update') {
  $post       = json_decode(file_get_contents("php://input"));
  $id         = $conn->real_escape_string(isset($post->id) ? $post->id : '');
  $ketSurvei  = $conn->real_escape_string(isset($post->ketSurvei) ? $post->ketSurvei : '');
  $persen     = $conn->real_escape_string(isset($post->persen) ? $post->persen : '');
  $query      = "UPDATE tbl_project SET ketSurvei = '$ketSurvei' , persen = '$persen', dateEntry=NOW(), time=NOW() WHERE idProject = '$id'";
  $runQuery = $conn->query($query);
  if ($runQuery) {
          $post       = json_decode(file_get_contents("php://input"));
          $id         = $conn->real_escape_string(isset($post->id) ? $post->id : '');
          $ketSurvei  = $conn->real_escape_string(isset($post->ketSurvei) ? $post->ketSurvei : '');
          $persen     = $conn->real_escape_string(isset($post->persen) ? $post->persen : '');
          $query2     = "INSERT INTO tbl_project_history (idProjectHistory, idProject, ketSurvei, persentase,dateEntry,time) VALUES ('','$id','$ketSurvei','$persen',NOW(),NOW())";
          $runQuery2 = $conn->query($query2);
          if ($runQuery2) {
            $post       = json_decode(file_get_contents("php://input"));
            $persen     = $conn->real_escape_string(isset($post->persen) ? $post->persen : '');
            $id         = $conn->real_escape_string(isset($post->id) ? $post->id : '');
            if ($post) {
              $nilai    = $persen;
              if ($nilai >= 100) {
                  $status = "1";
                  $query3   = "UPDATE tbl_project SET status='$status' WHERE idProject='$id'";
                  $runQuery3= $conn->query($query3);
              }
            }
          }
    $outp .= '{"status":"success",';
    $outp .= '"keterangan":"Berhasil Mengubah Data"}';
  } else {
    $outp .= '{"status":"error",';
    $outp .= '"keterangan":"Gagal Mengubah Data"}';
  }
  echo $outp;
}

if ($type == 'delete') {
  $post                      = json_decode(file_get_contents("php://input"));
  $idProjectHistory          = $conn->real_escape_string(isset($post->idProjectHistory) ? $post->idProjectHistory : '');
  $query      = "DELETE FROM tbl_project_history WHERE idProjectHistory = '$idProjectHistory'";
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