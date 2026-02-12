;(function(window, angular) {
  'use strict';
  // egy lekérdezést és egy requestet küldünk a phpnak
  angular.module('app')
  .controller('loginController',[
    '$scope', 'http','$rootScope','$state',
    function($scope,http,$rootScope,$state) {
  //login buttonre egy functiont hozunk lére
      $scope.loginButton = function () {
        http.request({
          url:"./php/login.php",
          data : $scope.loginData
        })
        // amennyiben a response ertéke null a felhasználónak üzenetet küldunk hogy sikertelen a bejelentkezés
        .then(response => {
          console.log(response);
          if (response == null) {
            alert("Sikertelen Bejelentkezés! ");
          }else{
        // ha nem null sikeres a bejelentkezés
            alert("Sikeres Bejelentkezés!");
            $rootScope.user = response;
            $rootScope.$applyAsync();
            // sikeres bejelentkezés esetén visszavisz a home oldalra
            $state.go('home');
          }
        })
        //console ra irja ki a hibát ha van 
        .catch(e => console.error(e));
      }
    }
  ]);


})(window, angular);
