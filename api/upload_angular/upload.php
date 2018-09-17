<?php
// Baca lokasi file sementar dan nama file dari form (fupload)
$lokasi_file = $_FILES['fupload']['tmp_name'];
$nama_file   = $_FILES['fupload']['name'];
// Tentukan folder untuk menyimpan file
$folder = "upload/$nama_file";
// tanggal sekarang
$tgl_upload = date("Ymd");
$id = $_POST['id'];
// Apabila file berhasil di upload
if (move_uploaded_file($lokasi_file,"$folder")){
  echo "Nama File : <b>$nama_file</b> sukses di upload";
  
  // Masukkan informasi file ke database
  $konek = mysqli_connect("localhost","root","","palembang");

  $query = "INSERT INTO upload (filename, idProjectHistory )
            VALUES('$nama_file', '$id' )";
            
  if(mysqli_query($konek, $query)){
  	header("location:index.php");
  }
}
else{
  echo "File gagal di upload";
}
?>