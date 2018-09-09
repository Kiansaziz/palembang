(function(){

    app.controller('projectDetailHistory', function($scope, $routeParams, $http, toastr, filterFilter, $location){

      // pencarian di hidden agar tidak lama load page
      $scope.search = {};



      var dataHistoryDetail = function() {
        var onSuccess = function(response){
          if (response.data == 'null') {
            $location.path('/project-history');
          } else if (response.data == "error") {
            toastr.warning('Terjadi Kesalahan');
          } else {
            $scope.history      = response.data;
          }
        }
        var onError = function(reason){
          toastr.error('Terjadi Kesalahan');
        }
        $http.post("../api/master/project-history.php?type=dataHistoryDetail",{"id":$routeParams.id}).then(onSuccess, onError);
      }
      dataHistoryDetail();

      var dataHistoryLihat = function() {
        var onSuccess = function(response){
          if (response.data == 'null') {
            $location.path('/project-history');
            dataHistoryLihat();
          } else if (response.data == "error") {
            toastr.warning('Terjadi Kesalahan');
          } else {
            $scope.historys      = response.data;
          }
        }
        var onError = function(reason){
          toastr.error('Terjadi Kesalahan');
        }
        $http.post("../api/master/project-history.php?type=dataHistoryLihat",{"id":$routeParams.id}).then(onSuccess, onError);
      }
      dataHistoryLihat();

         $scope.updateProject = function(){
        $http.post('../api/master/project-history.php?type=update', {
          'id' : $scope.history.idProject,
          'ketSurvei' : $scope.history.ketSurvei,
          'persen' : $scope.history.persen,
        }).success(function(response){
          if (response.status == 'success') {
            dataHistoryLihat();
            toastr.success(response.keterangan);
          } else if (response.status != 'success') {
            toastr.warning(response.keterangan);
          } else {
            toastr.warning('Terjadi Kesalahan');
          }
        });
      }

      $scope.deleteHistory = function(detail){
        tanya=confirm("Apakah anda yakin akan menghapus "+ detail.idProjectHistory +" ? ")
        if (tanya !="0")
        {
          $http.post('../api/master/project-history.php?type=delete',detail).success(function(data){
            if (data.status == 'success') {
              toastr.success(data.keterangan);
              dataHistoryLihat();
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

