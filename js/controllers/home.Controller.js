;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('homeController', [
  '$scope',
  '$http',
  '$stateParams',
  function($scope, $http, $stateParams) {

    $scope.data = [];
    $scope.Ligak = [];
    $scope.kivalasztott_tabella = null;
    $scope.kivalasztott_kep = null;

    $http.get('./php/home.php')
      .then(function(response) {

        $scope.data = response.data;

        // összes liga neve
        $scope.Ligak = [...new Set($scope.data.map(x => x.Liga))];

        // ha keresőből jött liga → arra állunk
        if ($stateParams.selectedLeague) {
          $scope.kivalasztott_tabella = $stateParams.selectedLeague;

          let ligaAdat = $scope.data.find(x => x.Liga === $scope.kivalasztott_tabella);
          if (ligaAdat) {
            $scope.kivalasztott_kep = ligaAdat.kepek;
          }
          return;
        }

        // alapértelmezett (első liga)
        $scope.kivalasztott_tabella = $scope.Ligak[0];

        let alap = $scope.data.find(x => x.Liga === $scope.kivalasztott_tabella);
        if (alap) {
          $scope.kivalasztott_kep = alap.kepek;
        }
      })

      .catch(error => console.error(error));

    // Manuális váltás
    $scope.tabella_kivalasztas = function() {
      let adat = $scope.data.find(x => x.Liga === $scope.kivalasztott_tabella);
      if (adat) {
        $scope.kivalasztott_kep = adat.kepek;
      }
    };

  }
]);

})(window, angular);
