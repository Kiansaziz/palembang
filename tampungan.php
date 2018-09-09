<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
    Kuesioner
    <small>Data Kuesioner</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#/"><i class="fa fa-dashboard"></i> Dashboard</a></li>
    <li class="active">Kuesioner</li>
  </ol>
</section>


<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-md-12">
       <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
          <li class="active"><a data-target="#semua" data-toggle="tab"><span class="fa fa-plus"></span> TAMBAH <span class="badge badge-info">{{projects.length}}</span></span></a></li>
          <li><a data-target="#selesai" data-toggle="tab">HISTORY PROJECT <span class="badge badge-pill badge-primary">{{projectsSelesais.length}}</span></a></li>
        </ul>
        <div class="tab-content">

      <div class="box box-primary">
        <div class="box-body">
          <div>
             
            <div class="col-xs-6">
              <table class="table table-bordered">
                <tr>
                  <td>Desa/Kelurahan</td>
                  <td>: {{history.kelurahan}}</td>
                </tr>
                <tr>
                  <td>Kecamatan</td>
                  <td>: {{history.kecamatan}}</td>
                </tr>
                <tr>
                  <td>Kabupaten</td>
                  <td>: MUARA ENIM</td>
                </tr>
                <tr>
                  <td>Mulai Project</td>
                  <td>: {{history.status}}</td>
                </tr>
                
              </table>
            </div>

             <div class="col-xs-6">
              <table class="table table-bordered">
                <tr>
                  <td>Desa/Kelurahan</td>
                  <td>: {{history.dinas}}</td>
                </tr>
                <tr>
                  <td>Kecamatan</td>
                  <td>: {{history.jenisPekerjaan}}</td>
                </tr>
                <tr>
                  <td>Kabupaten</td>
                  <td>: {{history.mulai}}</td>
                </tr>
                <tr>
                  <td>Mulai Project</td>
                  <td>: {{history.selesai}}</td>
                </tr>
              
              </table>
            </div>
            <form name="form" ng-submit="updateProject()" novalidate>
                <div class="col-md-12" style="margin-bottom: 20px;">
                  <label>Keterangan Survei</label>
                  <input type="hidden" name="id" ng-model="history.idProject">
                  <textarea type="text" name="ketSurvei" ng-model="history.ketSurvei" class="form-control" placeholder="Keterangan Survei......." required=""></textarea>
                  <span ng-show="form.ketSurvei.$invalid && !form.ketSurvei.$pristine"><i class="text-danger">Harus Di Isi</i></span>
                </div>
      
                 <div class="col-md-2">
                  <label>Persen</label>
                  <input type="text" name="persen" ng-model="history.persen" class="form-control" placeholder="persentase" required="">
                 <span ng-show="form.persen.$invalid && !form.persen.$pristine"><i class="text-danger">Harus Di Isi</i></span>
                </div>
                <div class="col-md-12" style="margin-top: 20px;">
                  <button type="submit" class="btn btn-danger" ng-disabled="form.$invalid">Submit</button>
              </div>
          </form>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box box-primary-->
         <div class="tab-pane" id="selesai">
            <div ng-include src="'project-selesai.html'"></div>
          </div>

    </div>
    <!-- /.col 12 -->
  </div>
  <!-- /.row -->
</section>
<!-- /.content -->
<script>
            function tampilkanPreview(gambar,idpreview){
//                membuat objek gambar
                var gb = gambar.files;
                
//                loop untuk merender gambar
                for (var i = 0; i < gb.length; i++){
//                    bikin variabel
                    var gbPreview = gb[i];
                    var imageType = /image.*/;
                    var preview=document.getElementById(idpreview);            
                    var reader = new FileReader();
                    
                    if (gbPreview.type.match(imageType)) {
//                        jika tipe data sesuai
                        preview.file = gbPreview;
                        reader.onload = (function(element) { 
                            return function(e) { 
                                element.src = e.target.result; 
                            }; 
                        })(preview);
 
    //                    membaca data URL gambar
                        reader.readAsDataURL(gbPreview);
                    }else{
//                        jika tipe data tidak sesuai
                        alert("Type file tidak sesuai. Khusus image.");
                    }
                   
                }    
            }

            function tampilkanPreview1(gambar,idpreview){
//                membuat objek gambar
                var gb = gambar.files;
                
//                loop untuk merender gambar
                for (var i = 0; i < gb.length; i++){
//                    bikin variabel
                    var gbPreview = gb[i];
                    var imageType = /image.*/;
                    var preview1=document.getElementById(idpreview);            
                    var reader = new FileReader();
                    
                    if (gbPreview.type.match(imageType)) {
//                        jika tipe data sesuai
                        preview1.file = gbPreview;
                        reader.onload = (function(element) { 
                            return function(e) { 
                                element.src = e.target.result; 
                            }; 
                        })(preview1);
 
    //                    membaca data URL gambar
                        reader.readAsDataURL(gbPreview);
                    }else{
//                        jika tipe data tidak sesuai
                        alert("Type file tidak sesuai. Khusus image.");
                    }
                   
                }    
            }

            function tampilkanPreview2(gambar,idpreview){
//                membuat objek gambar
                var gb = gambar.files;
                
//                loop untuk merender gambar
                for (var i = 0; i < gb.length; i++){
//                    bikin variabel
                    var gbPreview = gb[i];
                    var imageType = /image.*/;
                    var preview2=document.getElementById(idpreview);            
                    var reader = new FileReader();
                    
                    if (gbPreview.type.match(imageType)) {
//                        jika tipe data sesuai
                        preview2.file = gbPreview;
                        reader.onload = (function(element) { 
                            return function(e) { 
                                element.src = e.target.result; 
                            }; 
                        })(preview2);
 
    //                    membaca data URL gambar
                        reader.readAsDataURL(gbPreview);
                    }else{
//                        jika tipe data tidak sesuai
                        alert("Type file tidak sesuai. Khusus image.");
                    }
                   
                }    
            }
        </script>
        <script type="text/javascript">
          $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true,
            format:'yyyy-mm-dd'
          })
          </script>


<!--  <div class="col-md-12" style="margin-bottom: 20px;"> 
              <input type="file" accept="image/*" file-input="files" name="gambar1" ng-model="dataProject.gambar1" onchange="tampilkanPreview(this,'preview')" />
           
            <img id="preview" src="" alt="" width="320px"/>
           </div>
           <div class="col-md-12" style="margin-bottom: 20px;"> 
              <input type="file" accept="image/*" file-input="files" name="gambar2" ng-model="dataProject.gambar2"  onchange="tampilkanPreview1(this,'preview1')" />
            
            <img id="preview1" src="" alt="" width="320px"/>
           </div>
           <div class="col-md-12" style="margin-bottom: 20px;"> 
              <input type="file" accept="image/*" file-input="files" name="gambar3" ng-model="dataProject.gambar3" onchange="tampilkanPreview2(this,'preview2')" />
            
            <img id="preview2" src="" alt="" width="320px"/>
           </div> -->


           <!-- 
              <div class="col-xs-6 col-xs-offset-3">
                <div class="table table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th width="4%">No</th>
                        <th width="95%" style="text-align: center;">Dokumentasi Gambar Saat Survei Berlangsung</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td align="center"><img ng-src="../assets/images/{{project.gambar1}}" width="100%"></td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td align="center"><img ng-src="../assets/images/{{project.gambar2}}" width="100%"></td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td align="center"><img ng-src="../assets/images/{{project.gambar3}}" width="100%"></td>
                      </tr>
                    </tbody>
                </table>
                </div>
              </div> -->