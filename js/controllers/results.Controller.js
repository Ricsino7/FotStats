;(function(angular) {
  'use strict';

  angular.module('app')
  .controller('resultsController', ['$scope', '$http', function($scope, $http) {
    
    $scope.data = [];
    $scope.modalData = {
      hazai: '',
      vendeg: '',
      eredmeny: '',
      stat: []
    };

    // Meccsek betöltése
    $http.get('php/results.php').then(function(r) {
      console.log('Meccsek:', r.data);
      $scope.data = r.data;
    }).catch(function(e) {
      console.error('Hiba a meccsek betöltésénél:', e);
    });

    // Részletek gomb
    $scope.reszletek = function(meccs) {
      console.log('Meccs:', meccs);
      
      $scope.modalData.hazai = meccs.hazai;
      $scope.modalData.vendeg = meccs.vendeg;
      $scope.modalData.eredmeny = meccs.eredmeny;
      
      // ABSZOLÚT ÚTVONAL a biztonság kedvéért
      $http.get('./php/meccs_reszletek.php?id=' + meccs.id).then(function(r) {
        console.log('Statisztika:', r.data);
        $scope.modalData.stat = r.data;
        
        var modalElem = document.getElementById('reszletModal');
        if (modalElem) {
          var modal = new bootstrap.Modal(modalElem);
          modal.show();
        }
      }).catch(function(e) {
        console.error('Hiba a statisztika betöltésénél:', e);
        alert('Nem található a meccs_reszletek.php fájl!');
      });
    };
    
  }]);

})(angular);