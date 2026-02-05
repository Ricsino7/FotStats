
;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('registerController',[
    '$scope', 'http',
    function($scope,http) {
      $scope.registerButton = function () {
        console.log($scope.registerData);
        delete $scope.registerData['passwordConfirm'];
        delete $scope.registerData['radio'];
        console.log($scope.registerData);
        http.request({
          url: "./php/register.php",
          data: $scope.registerData
        })
        .then(response => {
          console.log(response);
          if (response == null) {
            alert("Az email vagy a felhasználónév már foglalt");
          }else {
            alert("Sikeres Regisztráció!");
          }
        })
        .catch(e => console.error(e));
      }

    
    }
  ]);


})(window, angular);
