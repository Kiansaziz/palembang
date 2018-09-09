(function(){

    app.controller('projectController', function($scope, AuthService, $http, toastr, filterFilter){


      var projects = function(){
        var onSuccess = function(response){
          if (response.data == "error") {
            toastr.danger('Terjadi Kesalahan');
          } else {
            $scope.projects = response.data;
          }
        }
        var onError = function(reason){
          toastr.warning('Terjadi Kesalahan');
        }
        $http.post("../api/master/project.php?type=dataProject")
        .then(onSuccess, onError);
      }
      projects();

      var dinass = function(){
        var onSuccess = function(response){
          if (response.data == "error") {
            toastr.danger('Terjadi Kesalahan');
          } else {
            $scope.dinass = response.data;
          }
        }
        var onError = function(reason){
          toastr.warning('Terjadi Kesalahan');
        }
        $http.post("../api/master/dinas.php?type=dataDinas")
        .then(onSuccess, onError);
      }
      dinass();



      var jeniss = function(){
        var onSuccess = function(response){
          if (response.data == "error") {
            toastr.danger('Terjadi Kesalahan');
          } else {
            $scope.jeniss = response.data;
          }
        }
        var onError = function(reason){
          toastr.warning('Terjadi Kesalahan');
        }
        $http.post("../api/master/jenis.php?type=dataJenis")
        .then(onSuccess, onError);
      }
      jeniss();

     
      $scope.changeKab = function(filter){
        if (filter.id_kab == '') {
          delete $scope.filter.id_kab;
          delete $scope.filter.id_kec;
        } else {
          delete $scope.filter.id_kec;
        }
      }

       

       var projectsSelesais = function(){
        var onSuccess = function(response){
          if (response.data == "error") {
            toastr.danger('Terjadi Kesalahan');
             projectsSelesais();
          } else {
            $scope.projectsSelesais = response.data;
          }
        }
        var onError = function(reason){
          toastr.warning('Terjadi Kesalahan');
        }
        $http.post("../api/master/project.php?type=dataProjectSelesai")
        .then(onSuccess, onError);
      }
      projectsSelesais();



      var projectsOnProgresss = function(){
        var onSuccess = function(response){
          if (response.data == "error") {
            toastr.danger('Terjadi Kesalahan');
             projectsOnProgresss();
          } else {
            $scope.projectsOnProgresss = response.data;
          }
        }
        var onError = function(reason){
          toastr.warning('Terjadi Kesalahan');
        }
        $http.post("../api/master/project.php?type=dataProjectOnProgress")
        .then(onSuccess, onError);
      }
      projectsOnProgresss();

      var projectsOverdus = function(){
        var onSuccess = function(response){
          if (response.data == "error") {
            toastr.danger('Terjadi Kesalahan');
             projectsOverdus();
          } else {
            $scope.projectsOverdus = response.data;
          }
        }
        var onError = function(reason){
          toastr.warning('Terjadi Kesalahan');
        }
        $http.post("../api/master/project.php?type=dataProjectOverdu")
        .then(onSuccess, onError);
      }
      projectsOverdus();




       


      $scope.hapusSelection = function(){
        $scope.selectionKornas = [];
        $scope.selectionKorwil = [];
      }
      $scope.selectionKornas = [];
      $scope.toggleSelectionKornas = function toggleSelectionKornas(isi) {
         var idx = $scope.selectionKornas.indexOf(isi);
         if (idx > -1) {
           $scope.selectionKornas.splice(idx, 1);
         } else {
           $scope.selectionKornas.push(isi);
         }
      };
      $scope.selectionKorwil = [];
      $scope.toggleSelectionKorwil = function toggleSelectionKorwil(isi) {
         var idx = $scope.selectionKorwil.indexOf(isi);
         if (idx > -1) {
           $scope.selectionKorwil.splice(idx, 1);
         } else {
           $scope.selectionKorwil.push(isi);
         }
      };

      // Klik submit form simpan
      // $scope.addProject = function(detail){
      //   detail.token  = JSON.parse(localStorage['_token']);
      //   $http.post('../api/master/project.php?type=insert', detail).success(function(response){
      //     if (response.status == 'success') {
      //       dinass();
      //       toastr.success(response.keterangan);
      //     } else if (response.status != 'success') {
      //       toastr.warning(response.keterangan);
      //     } else {
      //       toastr.warning('Terjadi Kesalahan');
      //     }
      //   });
      // }

      $scope.addProject = function(detail){
        detail.token  = JSON.parse(localStorage['_token']);
        $http.post('../api/master/project.php?type=insert', detail).success(function(response){
          if (response.status == 'success') {
            toastr.success(response.keterangan);
            projects();
            projectsOnProgresss();
            projectsOverdus();
            projectsSelesais();
          } else if (response.status != 'success') {
            toastr.warning(response.keterangan);
          } else {
            toastr.warning('Terjadi Kesalahan');
          }
        });
      }

      

      var users = function(){
        var onSuccess = function(response){
          if (response.data == "error") {
            toastr.danger('Terjadi Kesalahan');
          } else {
            $scope.users = response.data;
          }
        }
        var onError = function(reason){
          toastr.warning('Terjadi Kesalahan');
        }
        $http.post("../api/master/user.php?type=dataUser")
        .then(onSuccess, onError);
      }
      users();


      $scope.deleteProject = function(detail){
        tanya=confirm("Apakah anda yakin akan menghapus "+ detail.status +" ? ")
        if (tanya !="0")
        {
          $http.post('../api/master/project.php?type=delete',detail).success(function(data){
            if (data.status == 'success') {
              toastr.success(data.keterangan);
              projects();
            } else if (data.status != 'success') {
              toastr.warning(data.keterangan);
            } else {
              toastr.danger('Terjadi Kesalahan');
            }
          });
        }
      }

    });

}());


