(function(){

    app.controller('dinasDetailController', function($scope, $routeParams, $http, toastr, filterFilter, $location){

      // pencarian di hidden agar tidak lama load page
      $scope.search = {};



      var dataDinasDetail = function() {
        var onSuccess = function(response){
          if (response.data == 'null') {
            $location.path('/dinas');
          } else if (response.data == "error") {
            toastr.warning('Terjadi Kesalahan');
          } else {
            $scope.dinas      = response.data;
          }
        }
        var onError = function(reason){
          toastr.error('Terjadi Kesalahan');
        }
        $http.post("../api/master/dinas.php?type=dataDinasDetail",{"id":$routeParams.id}).then(onSuccess, onError);
      }
      dataDinasDetail();

      $scope.updateDinas = function(){
        $http.post('../api/master/dinas.php?type=update', {
          'id' : $scope.dinas.id,
          'dinas' : $scope.dinas.dinas,
        }).success(function(response){
          if (response.status == 'success') {
            window.location.href = '#/dinas';
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

