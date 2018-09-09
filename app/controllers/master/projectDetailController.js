(function(){
	app.controller('projectDetailController',  function($scope, $routeParams, $http, toastr, filterFilter, $location){
		$scope.search = {};

		var dataProjectDetail = function(){
			var onSuccess = function(response){
				if (response.data == 'null') {
					$location.path('project');
				}
				else if (response.data == 'error') {
					toastr.warning('Terjadi Kesalahan');
				} else{
					$scope.project = response.data;
				}
			}
			var onError = function(reason){
				toastr.error('Terjadi Kesalahan');
			}
			$http.post("../api/master/project.php?type=dataProjectDetail",{"id":$routeParams.id}).then(onSuccess, onError);
		}
		dataProjectDetail();
	});
}());
