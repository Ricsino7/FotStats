;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('lineupController', [
  '$scope',
  '$http',
  '$stateParams',
  function($scope, $http, $stateParams) {

    $scope.data = [];
    $scope.csapatnev = [];
    $scope.kivalasztott_csapat = null;
    $scope.kivalasztott_kep = null;

    $http.get('./php/lineup.php')
      .then(function(response) {

        $scope.data = response.data;

        // összes csapatnév
        $scope.csapatnev = [...new Set(response.data.map(x => x.csapatnev))];

        // ha keresőből jött csapat → arra állunk
        if ($stateParams.selectedTeam) {
          $scope.kivalasztott_csapat = $stateParams.selectedTeam;

          let adat = $scope.data.find(x => x.csapatnev === $scope.kivalasztott_csapat);
          if (adat) {
            $scope.kivalasztott_kep = adat.kepek;
          }
          return;
        }

        // alapértelmezett csapat
        $scope.kivalasztott_csapat = $scope.csapatnev[0];

        let alap = $scope.data.find(x => x.csapatnev === $scope.kivalasztott_csapat);
        if (alap) {
          $scope.kivalasztott_kep = alap.kepek;
        }
      })

      .catch(error => console.error(error));

    $scope.csapat_kivalsztas = function() {
      let adat = $scope.data.find(x => x.csapatnev === $scope.kivalasztott_csapat);
      if (adat) {
        $scope.kivalasztott_kep = adat.kepek;
      }
    };

  }
]);

})(window, angular);
