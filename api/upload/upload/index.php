<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Upload file progress bar dengan PHP dan MySQL. Tutorial oleh tutorialweb.net">
    <meta name="author" content="fatoni arif">
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>  

    <title>UPLOAD HASIL SURVEI</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	
	<div class="container" style="margin-top:10px; background-color: white;">
		<div class="well text-center">
			<h3>Upload Gambar Hasil Survei</h3>
			<p><b class="text-danger">max : 1mb</b></p>
			<div class="col-md-8 col-md-offset-2">
				<form class="form-inline" method="post" action="" style="margin-bottom: 10px;">
					<div><input type="hidden" name="id" value="<?php echo $_GET['id']?>" ></div>
					<div class="input-group">
						<label class="input-group-btn">
							<span class="btn btn-danger btn-sm">
								Browse&hellip; <input type="file" id="media" name="media" style="display: none;" required>

							</span>

						</label>
						<input type="text" class="form-control input-sm" size="40" readonly required>
					</div>
					<div class="input-group">
						<input type="submit" class="btn btn-sm btn-primary" value="Start upload">
					</div>
				</form>
				<br>
				<div class="progress" style="display:none">
					<div id="progressBar" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
						<span class="sr-only">0%</span>
					</div>
				</div>
				<div class="msg alert alert-info text-left" style="display:none"></div>
			</div>
			<div class="clearfix">
	
			<div class="col-md-12 ">	
			<div class="row">
						<?php 
							include "config.php";
							$id = $_GET['id'];
							$cek_query = $conn->query("SELECT * FROM files WHERE idProjectHistory='$id'");
							if ($cek_query->num_rows > 0) {
								while ($row = $cek_query->fetch_array()) {
									?>
									
									
									<div class="col-md-3 " >
										
										<img src="files/<?php echo $row['file_name']; ?>" width="100%"  class="thumbnail">
									
									</div>

									<?php

								}
							}
						 ?>
						                         
                		
			</div>
			</div>
		</div>
	</div>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/upload.js"></script>
    <script src="js/lihat.js"></script>
    <script>
	$(function() {
	  $(document).on('change', ':file', function() {
		var input = $(this),
			numFiles = input.get(0).files ? input.get(0).files.length : 1,
			label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		input.trigger('fileselect', [numFiles, label]);
	  });

	  $(document).ready( function() {
		  $(':file').on('fileselect', function(event, numFiles, label) {

			  var input = $(this).parents('.input-group').find(':text'),
				  log = numFiles > 1 ? numFiles + ' files selected' : label;

			  if( input.length ) {
				  input.val(log);
			  } else {
				  if( log ) alert(log);
			  }

		  });
	  });
	  
	});
	</script>
</body>
</html>
