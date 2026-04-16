;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('homeController', [
  '$scope',
  '$http',
  '$stateParams',
  '$rootScope',
  function($scope, $http, $stateParams, $rootScope) {

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

    $scope.frissit = function() {
          $http.get('./lang/' + $rootScope.lang.id + '.json?v=' + new Date().getTime()).then(function(res) {
              $scope.nyelv = res.data;
          });
      };

      // Induláskor betölt
      $scope.frissit();

      // Ha a menüben váltasz, ez észreveszi és újra lefut
      $rootScope.$watch('lang.id', function() {
          $scope.frissit();
      });
    //Szponzorok adatainak megadása amit megtudunk jeleniteni az oldalon
    $scope.szponzorok = [
        {
          nev: 'nike_name',
          kep: './img/szponzorok/nike_logo.jpg',
          leiras: 'nike_leiras',
          url: 'https://nike.com'
        },
        {
          nev: 'telekom_name',
          kep: './img/szponzorok/telekom.jpg',
          leiras: 'telekom_leiras',
          url: 'https://telekom.hu'
        },
        {
          nev: 'tippmixpro_name',
          kep: './img/szponzorok/tippmixpro.jpg',
          leiras: 'tippmixpro_leiras',
          url: 'https://tippmixpro.hu'
        },
         {
          nev: 'messi_name',
          kep: './img/szponzorok/messi_logo.jpg',
          leiras: 'messi_leiras',
          url: 'https://www.themessistore.com/?srsltid=AfmBOop_tgrIgOhqI1q5LunVgD1oEGRdk6PL6Uys21b9XUQRPqz9qt8B'
        },
        {
          nev: 'cr_name',
          kep: './img/szponzorok/cr7_logo.jpg',
          leiras: 'cr_leiras',
          url: 'https://www.cristianoronaldo.com/#cr7'
        }
    ];

  }]);

})(window, angular);
