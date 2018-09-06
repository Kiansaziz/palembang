(function(){

    app.controller('jenisDetailController', function($scope, $routeParams, $http, toastr, filterFilter, $location){

      // pencarian di hidden agar tidak lama load page
      $scope.search = {};



      var dataJenisDetail = function() {
        var onSuccess = function(response){
          if (response.data == 'null') {
            $location.path('/jenis');
          } else if (response.data == "error") {
            toastr.warning('Terjadi Kesalahan');
          } else {
            $scope.jenis      = response.data;
          }
        }
        var onError = function(reason){
          toastr.error('Terjadi Kesalahan');
        }
        $http.post("../api/master/jenis.php?type=dataJenisDetail",{"id":$routeParams.id}).then(onSuccess, onError);
      }
      dataJenisDetail();

         $scope.updateJenis = function(){
        $http.post('../api/master/jenis.php?type=update', {
          'id' : $scope.jenis.id,
          'jenisPekerjaan' : $scope.jenis.jenisPekerjaan,
        }).success(function(response){
          if (response.status == 'success') {
            window.location.href = '#/jenis';
            toastr.success(response.keterangan);
          } else if (response.status != 'success') {
            toastr.warning(response.keterangan);
          } else {
            toastr.warning('Terjadi Kesalahan');
          }
        });
      }



    });

}());

