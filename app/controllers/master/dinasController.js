(function(){

    app.controller('dinasController', function($scope, AuthService, $http, toastr){


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
      $scope.addUser = function(detail){
        $http.post('../api/master/dinas.php?type=insert', detail).success(function(response){
          if (response.status == 'success') {
            dinass();
            toastr.success(response.keterangan);
          } else if (response.status != 'success') {
            toastr.warning(response.keterangan);
          } else {
            toastr.warning('Terjadi Kesalahan');
          }
        });
      }


      $scope.deleteDinas = function(detail){
        tanya=confirm("Apakah anda yakin akan menghapus "+ detail.dinas +" ? ")
        if (tanya !="0")
        {
          $http.post('../api/master/dinas.php?type=delete',detail).success(function(data){
            if (data.status == 'success') {
              toastr.success(data.keterangan);
              dinass();
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
