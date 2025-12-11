;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('headerController', [
  '$rootScope',
  '$scope',
  '$http',
  '$state',
  function($rootScope, $scope, $http, $state) {

    $scope.toggleTheme = function() {
      $rootScope.darkMode = $rootScope.darkMode === "dark" ? "light" : "dark";
    };

    $scope.searchText = "";
    $scope.allItems = [];
    $scope.filtered = [];

    $http.get("./php/search.php").then(function(res) {
      $scope.allItems = res.data;
    });

    $scope.doSearch = function() {
      let text = ($scope.searchText || "").toLowerCase();

      if (!text) {
        $scope.filtered = [];
        return;
      }

      $scope.filtered = $scope.allItems.filter(function(item) {
        // csak csapat és liga kereshető
        if (item.type !== "team" && item.type !== "league") return false;
        return item.name.toLowerCase().includes(text);
      });
    };

    $scope.goToItem = function(item) {
      $scope.searchText = "";
      $scope.filtered = [];

      if (item.type === "team") {
        $state.go("lineup", { selectedTeam: item.name });
        return;
      }

      if (item.type === "league") {
        $state.go("home", { selectedLeague: item.name });
        return;
      }
    };

  }
]);

})(window, angular);
