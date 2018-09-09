(function(){

    app.controller('projectAddController', function($scope, AuthService, $http, toastr){


      var kecamatans = function(){
        var onSuccess = function(response){
          if (response.data == "error") {
            toastr.danger('Terjadi Kesalahan');
          } else {
            $scope.kecamatans = response.data;
          }
        }
        var onError = function(reason){
          toastr.warning('Terjadi Kesalahan');
        }
        $http.post("../api/master/project.php?type=dataKecamatan")
        .then(onSuccess, onError);
      }
      kecamatans();

      var kelurahans = function(){
        var onSuccess = function(response){
          if (response.data == "error") {
            toastr.danger('Terjadi Kesalahan');
          } else {
            $scope.kelurahans = response.data;
          }
        }
        var onError = function(reason){
          toastr.warning('Terjadi Kesalahan');
        }
        $http.post("../api/master/project.php?type=dataKelurahan", {'idKec' : $scope.idKec})
        .then(onSuccess, onError);
      }
      kelurahans();


      

    });

}());


