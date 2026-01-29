;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('betController',[
    '$scope', '$http',
    function($scope,$http) {

    $scope.data = [];
    //Lekérés
    $http.get('./php/bet.php') // az útvonal a PHP fájlhoz

        // Ha a lekérés sikeres, ezt a függvényt hívja meg
        .then(function(response) {
            // response.data tartalmazza a PHP által visszaadott JSON tömböt
            // Ezt betöltjük az Angular scope változójába
            // Így a HTML-ben az ng-repeat automatikusan frissíti a táblázatot
            $scope.data = response.data;

        })

        // Ha valami hiba történik a lekérés során, ezt a függvényt hívja meg
        .catch(function(error) {

            // Kiírjuk a konzolra a hibát, hogy lássuk mi ment rosszul
            console.error("Hiba a lekérésnél:", error);
        });
    }
  ]);


})(window, angular);
