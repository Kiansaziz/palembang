(function(){

    app.controller('jenisController', function($scope, AuthService, $http, toastr){


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


      // Klik submit form simpan
      $scope.addJenis = function(detail){
        $http.post('../api/master/jenis.php?type=insert', detail).success(function(response){
          if (response.status == 'success') {
            jeniss();
            toastr.success(response.keterangan);
          } else if (response.status != 'success') {
            toastr.warning(response.keterangan);
          } else {
            toastr.warning('Terjadi Kesalahan');
          }
        });
      }


       $scope.deleteJenis = function(detail){
        tanya=confirm("Apakah anda yakin akan menghapus "+ detail.jenisPekerjaan +" ? ")
        if (tanya !="0")
        {
          $http.post('../api/master/jenis.php?type=delete',detail).success(function(data){
            if (data.status == 'success') {
              toastr.success(data.keterangan);
              jeniss();
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
