;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('rolunkController',[
    '$scope',
    function($scope) {
      $scope.teamMembers = [
        { name: 'Bokor Richárd', 
          role: 'Projektvezető(Cégtulajodonos)', 
          image : './img/ricsi.jpg'},
        { name: 'Kulcsár Tamás Ámon', 
          role: 'Projektsegítő(Igazgató Úr)', 
          image : './img/tomi.jpg'},
      ];
      $scope.aboutText = `Ez egy olyan oldal ami összehozza az embereket és a 
                          futball világát a futball világának híreivel és eredményeivel;)`;
    }
  ]);
})(window, angular);
