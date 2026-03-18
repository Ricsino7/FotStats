;(function(window, angular){
  'use strict';

  // Ellenőrzött modul, ha még nincs deklarálva
  angular.module('app')
    .controller('statementController', ['$scope', function($scope){
      $scope.modalOpen = false;

      $scope.openModal = function() {
          $scope.modalOpen = true;
      };

      $scope.closeModal = function() {
          $scope.modalOpen = false;
      };
  }]);

})(window, angular);