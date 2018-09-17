<html>
<title>Form Upload</title>
<body>
<form enctype="multipart/form-data" method="POST" action="upload.php">
File yang di upload : <input type="file" name="fupload"><br>
Deskripsi File : <br>
File yang di upload : <input type="file" name="fupload"><br>
Deskripsi File : <br>
File yang di upload : <input type="file" name="fupload"><br>
Deskripsi File : <br>
<input  type="text" name="id" value="<?php echo $_GET['id'] ?>"  rows="8" cols="40"><br>

<input type=submit value=Upload>
</form>

