<?php
require('../connection.php');
require_once('../vendor/autoload.php');
use \Firebase\JWT\JWT;
define('SECRET_KEY','Rizki-Fachrulroji');
define('ALGORITHM','HS512');
$secretKey = base64_decode(SECRET_KEY);
$type      = $conn->real_escape_string(htmlentities($_GET['type']));





if($type == 'dataProject')
{
  $proses = $conn->query("SELECT * FROM tbl_project a 
                          INNER JOIN tbl_user b ON a.idUser=b.id
                          INNER JOIN tbl_kecamatan c ON a.idKec=c.idKec
                          INNER JOIN tbl_kelurahan d ON a.idKel=d.idKel
                          INNER JOIN tbl_dinas e ON a.idDinas=e.id
                          INNER JOIN tbl_jenis_pekerjaan f ON a.idJenisPekerjaan=f.id
                          INNER JOIN tbl_status g ON a.status=g.id
                          "
                        );
  if ($proses->num_rows >= 0) {
    while($rs = $proses->fetch_object()) {
            if ($rs) {
               $status = '3';
               $query = "UPDATE tbl_project SET status = '$status' WHERE selesai <= NOW() AND persen <=100 ";
               $runQuery= $conn->query($query);
             }
        $outpArr[] = $rs;
    }
  } else {
    $outpArr[]=null;
  }
  echo json_encode($outpArr);
}

if($type == 'dataProjectSelesai')
{
  $proses = $conn->query("SELECT * FROM tbl_project a 
                          INNER JOIN tbl_user b ON a.idUser=b.id
                          INNER JOIN tbl_kecamatan c ON a.idKec=c.idKec
                          INNER JOIN tbl_kelurahan d ON a.idKel=d.idKel
                          INNER JOIN tbl_dinas e ON a.idDinas=e.id
                          INNER JOIN tbl_jenis_pekerjaan f ON a.idJenisPekerjaan=f.id
                          INNER JOIN tbl_status g ON a.status=g.id WHERE a.status = '1'
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

if($type == 'dataProjectSelesaiCount')
{
  $proses = $conn->query("SELECT COUNT(*) AS total FROM tbl_project WHERE status='1'
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


if($type == 'dataProjectOnProgress')
{
  $proses = $conn->query("SELECT * FROM tbl_project a 
                          INNER JOIN tbl_user b ON a.idUser=b.id
                          INNER JOIN tbl_kecamatan c ON a.idKec=c.idKec
                          INNER JOIN tbl_kelurahan d ON a.idKel=d.idKel
                          INNER JOIN tbl_dinas e ON a.idDinas=e.id
                          INNER JOIN tbl_jenis_pekerjaan f ON a.idJenisPekerjaan=f.id
                          INNER JOIN tbl_status g ON a.status=g.id WHERE a.status = '2'
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

if($type == 'dataProjectOverdu')
{
  $proses = $conn->query("SELECT * FROM tbl_project a 
                          INNER JOIN tbl_user b ON a.idUser=b.id
                          INNER JOIN tbl_kecamatan c ON a.idKec=c.idKec
                          INNER JOIN tbl_kelurahan d ON a.idKel=d.idKel
                          INNER JOIN tbl_dinas e ON a.idDinas=e.id
                          INNER JOIN tbl_jenis_pekerjaan f ON a.idJenisPekerjaan=f.id
                          INNER JOIN tbl_status g ON a.status=g.id WHERE a.status = '3'
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



if ($type == 'dataProjectAdd') 
{
  $proses = $conn->query("SELECT * FROM tbl_project a 
                          INNER JOIN tbl_user b ON a.idUser=b.id
                          INNER JOIN tbl_kecamatan c ON a.idKec=c.idKec
                          INNER JOIN tbl_kelurahan d ON a.idKel=d.idKel
                          INNER JOIN tbl_dinas e ON a.idDinas=e.id
                          INNER JOIN tbl_jenis_pekerjaan f ON a.idJenisPekerjaan=f.id
                          INNER JOIN tbl_status g ON a.status=g.id"
                        );
  if($proses->num_rows > 0 ){
    while($rs = $proses->fetch_object()){
      $outpArr[] = $rs;
    }
  } else{
    $outpArr[]=null;
  }
  echo json_encode($outArr);
}

if($type == 'dataKecamatan')
{
  $proses = $conn->query("SELECT * FROM tbl_kecamatan  
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

if($type == 'dataKelurahan')
{
  $post     = json_decode(file_get_contents("php://input"));
  $idKec    = $conn->real_escape_string(isset($post->idKec)?$post->idKec : '');
  $proses = $conn->query("SELECT * FROM tbl_kelurahan WHERE idKec='$idKec'
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



// if ($type == 'insert') {
//   $post     = json_decode(file_get_contents("php://input"));
//   $idKec    = $conn->real_escape_string(isset($post->idKec)?$post->idKec : '');
//   $idKel    = $conn->real_escape_string(isset($post->idKel)?$post->idKel : '');
//   $idDinas    = $conn->real_escape_string(isset($post->idDinas)?$post->idDinas : '');
//   $idJenisPekerjaan    = $conn->real_escape_string(isset($post->idJenisPekerjaan)?$post->idJenisPekerjaan : '');
//   $ketSurvei    = $conn->real_escape_string(isset($post->ketSurvei)?$post->ketSurvei : '');
//   $gambar1    = $conn->real_escape_string(isset($post->gambar1)?$post->gambar1 : '');
//   $gambar2    = $conn->real_escape_string(isset($post->gambar2)?$post->gambar2 : '');
//   $gambar3    = $conn->real_escape_string(isset($post->gambar3)?$post->gambar3 : '');
//   $mulai    = $conn->real_escape_string(isset($post->mulai)?$post->mulai : '');
//   $selesai    = $conn->real_escape_string(isset($post->selesai)?$post->selesai : '');
//   $persen    = $conn->real_escape_string(isset($post->persen)?$post->persen : '');
//   date_default_timezone_set('Asia/Jakarta');
//   $date = date("Y-m-d H:i:s");
    
//   $query    = "INSERT INTO tbl_project (idKec,idKel,idDinas,idJenisPekerjaan,ketSurvei, gambar1, gambar2, gambar3,mulai,selesai,persen,status,dateEntry,time) VALUES ('$idKec','$idKel','$idDinas','$idJenisPekerjaan','$ketSurvei','$gambar1', '$gambar2', '$gambar3', '$mulai', '$selesai','$persen','2','$date','$date')";
//   $runQuery = $conn->query($query);
//   if ($runQuery) {
//     $outp .= '{"status":"success",';
//     $outp .= '"keterangan":"Berhasil Memasukan Data"}';
//   } else {
//     $outp .= '{"status":"error",';
//     $outp .= '"keterangan":"Gagal Memasukan Data"}';
//   }
  
//   echo $outp;
// }

if($type == 'insert')
{
  $post   = json_decode(file_get_contents("php://input"));
  $jwt    = $conn->real_escape_string($post->token);
  $idKec = $conn->real_escape_string(isset($post->idKec) ? $post->idKec : '');
  $idKel    = $conn->real_escape_string(isset($post->idKel) ? $post->idKel : '');
  $idDinas    = $conn->real_escape_string(isset($post->idDinas) ? $post->idDinas : '');
  $idJenisPekerjaan    = $conn->real_escape_string(isset($post->idJenisPekerjaan) ? $post->idJenisPekerjaan : '');
  $ketSurvei    = $conn->real_escape_string(isset($post->ketSurvei) ? $post->ketSurvei : '');
  $mulai    = $conn->real_escape_string(isset($post->mulai) ? $post->mulai : '');
  $selesai    = $conn->real_escape_string(isset($post->selesai) ? $post->selesai : '');
  $persen    = $conn->real_escape_string(isset($post->persen) ? $post->persen : '');
  try {
     $DecodedDataArray = JWT::decode(
       $jwt,
       $secretKey,
       array(ALGORITHM)
     );
     $dari     = $DecodedDataArray->data->id;
     $query    = "INSERT INTO tbl_project (idProject,idKec,idKel,idUser,idDinas,idJenisPekerjaan,ketSurvei,mulai,selesai,persen,dateEntry,time,status) VALUES 
     ('', '$idKec', '$idKel', '$dari','$idDinas','$idJenisPekerjaan','$ketSurvei','$mulai','$selesai','$persen',NOW(),NOW(),'2')";
     $runQuery = $conn->query($query);

     if ($runQuery) {
       $outp .= '{"status":"success",';
       $outp .= '"keterangan":"Berhasil Memasukan Data"}';
     } else {
       $outp .= '{"status":"error",';
       $outp .= '"keterangan":"Gagal Memasukan Data"}';
     }

  } catch (Exception $e) {
    $outp .= '{"status":"error",';
    $outp .= '"keterangan":"Gagal Memproses Data"}';
  }
  echo $outp;
}

if($type == 'update')
{
  $post   = json_decode(file_get_contents("php://input"));
  $jwt    = $conn->real_escape_string($post->token);
  $idKec = $conn->real_escape_string(isset($post->idKec) ? $post->idKec : '');
  $idProject = $conn->real_escape_string(isset($post->idProject) ? $post->idProject : '');
  $idKel    = $conn->real_escape_string(isset($post->idKel) ? $post->idKel : '');
  $idDinas    = $conn->real_escape_string(isset($post->idDinas) ? $post->idDinas : '');
  $idJenisPekerjaan    = $conn->real_escape_string(isset($post->idJenisPekerjaan) ? $post->idJenisPekerjaan : '');
  $ketSurvei    = $conn->real_escape_string(isset($post->ketSurvei) ? $post->ketSurvei : '');
  $mulai    = $conn->real_escape_string(isset($post->mulai) ? $post->mulai : '');
  $selesai    = $conn->real_escape_string(isset($post->selesai) ? $post->selesai : '');
  $persen    = $conn->real_escape_string(isset($post->persen) ? $post->persen : '');
  date_default_timezone_set('Asia/Jakarta');
  $date = date("Y-m-d H:i:s");
  try {
     $DecodedDataArray = JWT::decode(
       $jwt,
       $secretKey,
       array(ALGORITHM)
     );
     $dari     = $DecodedDataArray->data->id;
     $query    = "INSERT INTO tbl_project_history (idProjectHistory,idKec,idProject) VALUES ('','$idKec','$idProject')";
     $runQuery = $conn->query($query);

     if ($runQuery) {
       $outp .= '{"status":"success",';
       $outp .= '"keterangan":"Berhasil Memasukan Data"}';
     } else {
       $outp .= '{"status":"error",';
       $outp .= '"keterangan":"Gagal Memasukan Data"}';
     }

  } catch (Exception $e) {
    $outp .= '{"status":"error",';
    $outp .= '"keterangan":"Gagal Memproses Data"}';
  }
  echo $outp;
}



if($type == 'dataProjectDetail')
{
  $post   = json_decode(file_get_contents("php://input"));
  $id     = $conn->real_escape_string($post->id);
  $proses = $conn->query("SELECT * FROM tbl_project a 
                          INNER JOIN tbl_user b ON a.idUser=b.id
                          INNER JOIN tbl_kecamatan c ON a.idKec=c.idKec
                          INNER JOIN tbl_kelurahan d ON a.idKel=d.idKel
                          INNER JOIN tbl_dinas e ON a.idDinas=e.id
                          INNER JOIN tbl_jenis_pekerjaan f ON a.idJenisPekerjaan=f.id
                          INNER JOIN tbl_status g ON a.status=g.id WHERE a.idProject='$id'");
  if ($proses->num_rows > 0) {
    $outp = $proses->fetch_object();
  } else {
    $outp=null;
  }
  echo json_encode($outp);
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
                          WHERE a.idProject='$id'");
  if ($proses->num_rows > 0) {
    $outp = $proses->fetch_object();
  } else {
    $outp=null;
  }
  echo json_encode($outp);
}

if($type == 'dataProjectHistory')
{
  $post   = json_decode(file_get_contents("php://input"));
  $id     = $conn->real_escape_string($post->id);
  $proses = $conn->query("SELECT * FROM tbl_project a 
                          INNER JOIN tbl_user b ON a.idUser=b.id
                          INNER JOIN tbl_kecamatan c ON a.idKec=c.idKec
                          INNER JOIN tbl_kelurahan d ON a.idKel=d.idKel
                          INNER JOIN tbl_dinas e ON a.idDinas=e.id
                          INNER JOIN tbl_jenis_pekerjaan f ON a.idJenisPekerjaan=f.id
                          INNER JOIN tbl_status g ON a.status=g.id WHERE a.idProject='$id'
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





// if ($type == 'update') {
//   $post     = json_decode(file_get_contents("php://input"));
//   $id       = $conn->real_escape_string(isset($post->id) ? $post->id : '');
//   $dinas     = $conn->real_escape_string(isset($post->dinas) ? $post->dinas : '');
//   $query = "UPDATE tbl_dinas SET dinas = '$dinas' WHERE id = '$id'";
//   $runQuery = $conn->query($query);
//   if ($runQuery) {
//     $outp .= '{"status":"success",';
//     $outp .= '"keterangan":"Berhasil Mengubah Data"}';
//   } else {
//     $outp .= '{"status":"error",';
//     $outp .= '"keterangan":"Gagal Mengubah Data"}';
//   }
//   echo $outp;
// }




if ($type == 'delete') {
  $post        = json_decode(file_get_contents("php://input"));
  $idProject          = $conn->real_escape_string(isset($post->idProject) ? $post->idProject : '');
  $query      = "DELETE FROM tbl_project WHERE idProject = '$idProject'";
  if ($conn->query($query)) {
           $post        = json_decode(file_get_contents("php://input"));
           $idProject          = $conn->real_escape_string(isset($post->idProject) ? $post->idProject : '');
           $query2      = "DELETE FROM tbl_project_history WHERE idProject = '$idProject'";
           $runQuery = $conn->query($query2);

    $outp .= '{"status":"success",';
    $outp .= '"keterangan":"Berhasil Menghapus Data"}';
  } else {
    $outp .= '{"status":"error",';
    $outp .= '"keterangan":"Gagal Menghapus Data"}';
  }
  echo $outp;
}









?>
