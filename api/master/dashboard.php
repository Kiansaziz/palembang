<?php
require('../connection.php');
require_once('../vendor/autoload.php');
use \Firebase\JWT\JWT;
define('SECRET_KEY','Rizki-Fachrulroji');
define('ALGORITHM','HS512');
$secretKey = base64_decode(SECRET_KEY);
$type      = $conn->real_escape_string(htmlentities($_GET['type']));


if($type == 'kuesioner')
{
  $proses = $conn->query("SELECT
                            COUNT(idProject) jumlah,
                            SUM(CASE WHEN status = '1' THEN 1 ELSE 0 END) finish,
                            SUM(CASE WHEN status = '2' THEN 1 ELSE 0 END) onprogress,
                            SUM(CASE WHEN status = '3' THEN 1 ELSE 0 END) overdu
                          FROM tbl_project
                          ");
  if ($proses->num_rows > 0) {
    while($rs = $proses->fetch_object()) {
        $outp = $rs;
    }
  } else {
    $outp=null;
  }
  echo json_encode($outp);
}


if($type == 'capaian_percent')
{
  $proses = $conn->query("SELECT
                            tbl_kecamatan.kecamatan,
                            COUNT(tbl_project.idProject) target,
                            SUM(CASE WHEN tbl_project.status = '1' THEN 1 ELSE 0 END) finish,
                            SUM(CASE WHEN tbl_project.status = '2' THEN 1 ELSE 0 END) onprogress,
                            SUM(CASE WHEN tbl_project.status = '3' THEN 1 ELSE 0 END) overdu
                          FROM tbl_project
                          INNER JOIN tbl_kecamatan ON tbl_project.idKec=tbl_kecamatan.idKec
                          GROUP BY tbl_project.idKec
                          ");
  if ($proses->num_rows > 0) {
    while($rs = $proses->fetch_object()) {
        $rs->target = 100;
        $outpArr[] = $rs;
    }
  } else {
    $outpArr[]=null;
  }
  echo json_encode($outpArr);
}



if($type == 'capaian')
{
  $proses = $conn->query("SELECT
                        	  tbl_kecamatan.kecamatan,
                            COUNT(tbl_project.idProject) target,
                            SUM(CASE WHEN tbl_project.status = '1' THEN 1 ELSE 0 END) finish,
                            SUM(CASE WHEN tbl_project.status = '2' THEN 1 ELSE 0 END) onprogress,
                            SUM(CASE WHEN tbl_project.status = '3' THEN 1 ELSE 0 END) overdu
                          FROM tbl_project
                          INNER JOIN tbl_kecamatan ON tbl_project.idKec=tbl_kecamatan.idKec
                          GROUP BY tbl_project.idKec
                          ");
  if ($proses->num_rows > 0) {
    while($rs = $proses->fetch_object()) {
        $outpArr[] = $rs;
    }
  } else {
    $outpArr[]=null;
  }
  echo json_encode($outpArr);
}


if($type == 'jenis_kelamin')
{
  $proses = $conn->query("SELECT COUNT(tbl_project.status) as value,
                                        tbl_status.id as label
                                        FROM tbl_project
                                        INNER JOIN tbl_status ON tbl_project.status = tbl_status.id
                                        
                                        ");
  if ($proses->num_rows > 0) {
    while($rs = $proses->fetch_object()) {
        $outpArr[] = $rs;
    }
  } else {
    $outpArr[]=null;
  }
  echo json_encode($outpArr);
}

if($type == 'profesi')
{
  $proses = $conn->query("SELECT COUNT(tbl_project.idProject) as value,
                                        tbl_dinas.dinas as label
                                        FROM tbl_project
                                        INNER JOIN tbl_dinas ON tbl_project.idDinas = tbl_dinas.id
                                        GROUP BY tbl_dinas.dinas
                                        ");
  if ($proses->num_rows > 0) {
    while($rs = $proses->fetch_object()) {
        $outpArr[] = $rs;
    }
  } else {
    $outpArr[]=null;
  }
  echo json_encode($outpArr);
}


if($type == 'usia')
{
  $proses = $conn->query("SELECT COUNT(tbl_project.idProject) as value,
                                        tbl_jenis_pekerjaan.jenisPekerjaan as label
                                        FROM tbl_project
                                        INNER JOIN tbl_jenis_pekerjaan ON tbl_project.idJenisPekerjaan = tbl_jenis_pekerjaan.id
                                        GROUP BY tbl_jenis_pekerjaan.jenisPekerjaan
                                        ");
  if ($proses->num_rows > 0) {
    while($rs = $proses->fetch_object()) {
        $outpArr[] = $rs;
    }
  } else {
    $outpArr[]=null;
  }
  echo json_encode($outpArr);
}



if($type == 'pendidikan')
{
  $proses = $conn->query("SELECT COUNT(tbl_project.idProject) as value,
                                        tbl_status.status as label
                                        FROM tbl_project
                                        INNER JOIN tbl_status ON tbl_project.status = tbl_status.id
                                        GROUP BY tbl_status.status
                                        ");
  if ($proses->num_rows > 0) {
    while($rs = $proses->fetch_object()) {
        $outpArr[] = $rs;
    }
  } else {
    $outpArr[]=null;
  }
  echo json_encode($outpArr);
}

?>
