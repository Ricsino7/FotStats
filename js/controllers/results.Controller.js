;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('resultsController', ['$scope', '$http', function($scope, $http) {

    // Inicializálunk egy üres tömböt a hírek tárolására
    // Ide fogja betölteni a PHP-ból érkező JSON adatokat
    $scope.data = [];

    // Lekérjük a híreket a PHP fájlból Angular $http segítségével
    $http.get('./php/results.php') // az útvonal a PHP fájlhoz

        // Ha a lekérés sikeres, ezt a függvényt hívja meg
        .then(function(response) {

            // response.data tartalmazza a PHP által visszaadott JSON tömböt
            // Ezt betöltjük az Angular scope változójába, így a HTML ng-repeat-je automatikusan frissül
            $scope.data = response.data;

        })

        // Ha valami hiba történik a lekérés során, ezt a függvényt hívja meg
        .catch(function(error) {

            // Kiírjuk a konzolra a hibát, hogy lássuk mi ment rosszul
            console.error("Hiba a lekérésnél:", error);
        });

}]);

})(window, angular);
