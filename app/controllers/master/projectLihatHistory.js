(function(){

    app.controller('projectLihatHistory', function($scope, $routeParams, $http, toastr, filterFilter, $location){

      // pencarian di hidden agar tidak lama load page
      $scope.search = {};



      var dataHistory = function() {
        var onSuccess = function(response){
          if (response.data == 'null') {
            $location.path('/project-history');
          } else if (response.data == "error") {
            toastr.warning('Terjadi Kesalahan');
          } else {
            $scope.historys      = response.data;
          }
        }
        var onError = function(reason){
          toastr.error('Terjadi Kesalahan');
        }
        $http.post("../api/master/project.php?type=dataProject",{"id":$routeParams.id}).then(onSuccess, onError);
      }
      dataHistory();

         $scope.updateProject = function(){
        $http.post('../api/master/project-history.php?type=update', {
          'id' : $scope.history.idProject,
          'ketSurvei' : $scope.history.ketSurvei,
          'persen' : $scope.history.persen,
        }).success(function(response){
          if (response.status == 'success') {
            window.location.href = '#/project';
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

