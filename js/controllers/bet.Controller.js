;(function(window, angular) {
  'use strict';

  angular.module('app')
   .controller('betController',[
    '$scope', '$http',
    function($scope, $http) {

    $scope.data = [];
    $scope.activeTab = '1x2';
    $scope.ticket = [];
    $scope.stakeAmount = 1000;
    $scope.totalWin = 0;
    $scope.removeIndex = null;

    // TILTÁSOK
    $scope.checkRestrictions = function(match, tip) {
      for (var i = 0; i < $scope.ticket.length; i++) {
        var t = $scope.ticket[i];
        if (t.match.hazai === match.hazai && t.match.vendeg === match.vendeg) {
          if ((t.tip === 'Hazai' && tip === 'Vendég') || (t.tip === 'Vendég' && tip === 'Hazai')) return 'Hazai és Vendég nem együtt!';
          if ((t.tip === 'Hazai' && tip === 'Döntetlen') || (t.tip === 'Döntetlen' && tip === 'Hazai')) return 'Hazai és Döntetlen nem együtt!';
          if ((t.tip === 'Vendég' && tip === 'Döntetlen') || (t.tip === 'Döntetlen' && tip === 'Vendég')) return 'Vendég és Döntetlen nem együtt!';
          if ((t.tip === 'Over 2.5' && tip === 'Under 2.5') || (t.tip === 'Under 2.5' && tip === 'Over 2.5')) return 'Over 2.5 és Under 2.5 nem együtt!';
          if ((t.tip === 'Over 1.5' && tip === 'Under 1.5') || (t.tip === 'Under 1.5' && tip === 'Over 1.5')) return 'Over 1.5 és Under 1.5 nem együtt!';
          if ((t.tip === 'BTTS Igen' && tip === 'BTTS Nem') || (t.tip === 'BTTS Nem' && tip === 'BTTS Igen')) return 'BTTS Igen és Nem nem együtt!';
          if ((t.tip === 'Over 7.5' && tip === 'Under 7.5') || (t.tip === 'Under 7.5' && tip === 'Over 7.5')) return 'Over 7.5 és Under 7.5 nem együtt!';
          if ((t.tip === 'Hazai több szöglet' && tip === 'Vendég több szöglet') || (t.tip === 'Vendég több szöglet' && tip === 'Hazai több szöglet')) return 'Hazai és Vendég szöglet nem együtt!';
          if (t.tip === tip) return 'Ezt már hozzáadtad!';
        }
      }
      return null;
    };

    // NYEREMÉNY SZÁMÍTÁS (oddsok összeszorzása)
    $scope.calcWin = function() {
      if ($scope.ticket.length === 0) {
        $scope.totalOdds = 0;
        $scope.totalWin = 0;
        return;
      }

      var szorzat = 1;
      for (var i = 0; i < $scope.ticket.length; i++) {
        szorzat = szorzat * parseFloat($scope.ticket[i].odd);
      }

      $scope.totalOdds = szorzat;
      $scope.totalWin = Math.floor($scope.stakeAmount * szorzat);
    };

    // FOGADÁS HOZZÁADÁS
    $scope.addToTicket = function(match, tip, odd) {
      var error = $scope.checkRestrictions(match, tip);
      if (error) {
        alert(error);
        return;
      }
      $scope.ticket.push({
        match: match,
        tip: tip,
        odd: parseFloat(odd)
      });
      $scope.calcWin();
    };

    // TELJES TÖRLÉS
    $scope.openClearModal = function() {
      if ($scope.ticket.length > 0) {
        $('#torlesModal').modal('show');
      }
    };

    $scope.confirmClearTicket = function() {
      $scope.ticket = [];
      $scope.stakeAmount = 1000;
      $scope.calcWin();
    };

    // EGYEDI TÖRLÉS
    $scope.openRemoveModal = function(index) {
      $scope.removeIndex = index;
      $('#removeBetModal').modal('show');
    };

    $scope.confirmRemoveBet = function() {
      if ($scope.removeIndex !== null) {
        $scope.ticket.splice($scope.removeIndex, 1);
        $scope.calcWin();
      }
      $scope.removeIndex = null;
    };

    $scope.setTab = function(tab) {
      $scope.activeTab = tab;
    };

    $http.get('./php/bet.php').then(function(response) {
      $scope.data = response.data;
    });

    }
  ]);

})(window, angular);
