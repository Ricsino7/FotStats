;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('homeController', [
  '$scope',
  '$http',
  '$stateParams',
  function($scope, $http, $stateParams) {

    // alap scope változók
    $scope.data = [];
    $scope.Ligak = [];
    $scope.kivalasztott_tabella = null;
    $scope.kivalasztott_kep = null;

    // tabella adatok betöltése
    $http.get('./php/home.php')
      .then(function(response) {

        // teljes adatlista
        $scope.data = response.data;

        // ligák kigyűjtése
        $scope.Ligak = [...new Set($scope.data.map(x => x.Liga))];

        // ha keresőből érkeztünk (konkrét liga)
        if ($stateParams.selectedLeague) {
          $scope.kivalasztott_tabella = $stateParams.selectedLeague;

          let ligaAdat = $scope.data.find(
            x => x.Liga === $scope.kivalasztott_tabella
          );

          if (ligaAdat) {
            $scope.kivalasztott_kep = ligaAdat.kepek;
          }
          return;
        }

        // alapértelmezett liga (első)
        $scope.kivalasztott_tabella = $scope.Ligak[0];

        let alap = $scope.data.find(
          x => x.Liga === $scope.kivalasztott_tabella
        );

        if (alap) {
          $scope.kivalasztott_kep = alap.kepek;
        }
      })
      .catch(error => console.error(error));

    // manuális liga váltás selectből
    $scope.tabella_kivalasztas = function() {
      let adat = $scope.data.find(
        x => x.Liga === $scope.kivalasztott_tabella
      );

      if (adat) {
        $scope.kivalasztott_kep = adat.kepek;
      }
    };

    $scope.kepek = [0, 1, 2];

    $scope.szponzorok = [
        {
            nev: 'Nike',
            kep: './img/szponzorok/nike_logo.jpg',
            leiras: 'A legjobb ötözékekért!',
            url: 'https://nike.com'
        },
        {
            nev: 'Telekom',
            kep: './img/szponzorok/telekom.jpg',
            leiras: 'A legjobb szolgáltatásért!',
            url: 'https://telekom.hu'
        },
        {
            nev: 'Tippmixpro',
            kep: './img/szponzorok/tippmixpro.jpg',
            leiras: 'Játssz velünk most!',
            url: 'https://tippmixpro.hu'
        }
    ];

  }]);

})(window, angular);
