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
          role: 'Projektvezető (cégtulajdonos)',
          image: './img/ricsi.jpg'
        },
        {
          name2: 'Kulcsár Tamás Ámon',
          role2: 'Projektsegítő (igazgató úr)',
          image: './img/tomi.jpg'
        }
      ];

      // Rólunk szöveg
      $scope.aboutText =
        'Ez egy olyan oldal, ami összehozza az embereket és ' +
        'a futball világát, a futball világának híreivel és eredményeivel;)';

    }
  ]);

})(window, angular);
