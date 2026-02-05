;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('loginController',[
    '$scope', 'http','$rootScope','$state',
    function($scope,http,$rootScope,$state) {
      $scope.loginButton = function () {
        http.request({
          url:"./php/login.php",
          data : $scope.loginData
        })
        .then(response => {
          console.log(response);
          if (response == null) {
            alert("Sikertelen Bejelentkezés! ");
          }else{
            alert("Sikeres Bejelentkezés!");
            $rootScope.user = response;
            $rootScope.$applyAsync();
            $state.go('home');
          }
        })
        .catch(e => console.error(e));
      }
    }
  ]);


})(window, angular);
