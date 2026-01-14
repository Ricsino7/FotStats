;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('headerController', [
  '$rootScope',
  '$scope',
  '$http',
  '$state',
  function($rootScope, $scope, $http, $state) {

    // Dark / Light mód váltás
    $rootScope.darkMode = "dark";
    $scope.toggleTheme = function() {
      $rootScope.darkMode =
        $rootScope.darkMode === "dark" ? "light" : "dark";
    };

    // Kereső alap változók
    $scope.searchText = "";
    $scope.allItems = [];
    $scope.filtered = [];

    // Kereshető elemek betöltése (csapatok + ligák)
    $http.get("./php/search.php").then(function(res) {
      $scope.allItems = res.data;
    });

    // Keresés futtatása
    $scope.doSearch = function() {
      let text = ($scope.searchText || "").toLowerCase();

      // üres kereső → nincs találat
      if (!text) {
        $scope.filtered = [];
        return;
      }

      // csak csapat és liga szűrhető
      $scope.filtered = $scope.allItems.filter(function(item) {
        if (item.type !== "team" && item.type !== "league") return false;
        return item.name.toLowerCase().includes(text);
      });
    };

    // Kattintás a keresési találatra
    $scope.goToItem = function(item) {

      // kereső ürítése
      $scope.searchText = "";
      $scope.filtered = [];

      // csapat → lineup oldal
      if (item.type === "team") {
        $state.go("lineup", { selectedTeam: item.name });
        return;
      }

      // liga → home oldal
      if (item.type === "league") {
        $state.go("home", { selectedLeague: item.name });
        return;
      }
    };

    // Nyelvváltás
    $scope.language = "HU";
    $rootScope.changeLanguage = () => {
      $rootScope.lang.id = $scope.language.toLowerCase();
      $rootScope.getLanguageData();
    };

  }]);

})(window, angular);
