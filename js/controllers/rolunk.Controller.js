;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('rolunkController', [
    '$scope',
    function($scope) {

      // Csapattagok adatai
      $scope.teamMembers = [
        {
          name: 'Bokor Richárd',
          role: 'Projektvezető',
          image: './img/ricsi.jpg'
        },
        {
          name: 'Kulcsár Tamás Ámon',
          role: 'Webfejlesztő',
          image: './img/tomi.jpg'
        }
      ];

      // Rólunk szöveg
      $scope.aboutText =
        'A FotStats egy modern futballplatform, amely ötvözi a valós idejű statisztikákat, ' +
        'a szurkolói élményt és a szakmai mélységet. Nálunk nem csak azt látod, hogy ki nyert, ' +
        'hanem azt is, hogyan – hány szögletből, hányadik percben, és hány szurkoló vesztette el ' +
        'a hangját közben. ' +
        'Az oldalt azért hoztuk létre, mert mi is átéltük már, hogy a meccs közben 12 lapot kell nyitnunk ' +
        'egy-egy adatért. Mostantól elég egy kattintás – és igen, a kávéd mellett is elfér a képernyőn. ' +
        'Nem ígérjük, hogy a kedvenc csapatod nyerni fog, de azt igen, hogy nálunk minden adatot ' +
        'megtalálsz hozzá – még azt is, hogy a kapus hányszor rúgta fel a labdát a kispadra. ' +
        'FotStats: statisztika, humor, foci. Három az egyben.';
    }
  ]);

})(window, angular);
