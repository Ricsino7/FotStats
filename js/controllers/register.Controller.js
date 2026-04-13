
;(function(window, angular) {
  'use strict';
  //register buttonra létrehozznk egy funkciot
  angular.module('app')
  .controller('registerController',[
    '$scope', 'http','$state',
    function($scope,http,$state) {
      $scope.registerButton = function () {
        console.log($scope.registerData);
        //törölni kellet ezt a két dolgot mivel több adatot adtunk volna mint amit kértünk volna ezért nem működött volna
        delete $scope.registerData['passwordConfirm'];
        delete $scope.registerData['radio'];
        console.log($scope.registerData);
        //küldunk a php nak egy kérést amiben a register php ra ezután datanak megadjuk a register datat
        http.request({
          url: "./php/register.php",
          data: $scope.registerData
        })
        //ha a response null akkor egy alertet küldünk hogy foglalt email vagy felhaszanlo
        .then(response => {
          console.log(response);
          if (response == null) {
            alert("Az email vagy a felhasználónév már foglalt");
            //ha sikeres pedig be tud majd jelentkezni
          }else {
            alert("Sikeres Regisztráció!");
            $state.go('login')
          }
          
        })
        .catch(e => console.error(e));
      }

    
    }
  ]);


})(window, angular);
