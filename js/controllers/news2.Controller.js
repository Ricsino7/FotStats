;(function(window, angular) {
  'use strict';

  // app modulhoz tartozó newsController
  angular.module('app')
  .controller('news2Controller', ['$scope', '$http', function($scope, $http) {

    // ide jön le a PHP-ból az összes hír
    $scope.data = [];

    // ide tesszük a feldolgozott (1 nagy + 4 kicsi) struktúrát
    //$scope.groupedNews = [];

    // hírek lekérése backendről
    $http.get('./php/news.php')
      .then(function(response) {

        // teljes hír lista eltárolása
        $scope.data = response.data;
        $scope.$applyAsync();

        // biztos ami biztos, nullázzuk
        //$scope.groupedNews = [];

        // FotMob stílus:
        // 1 nagy kártya + 4 kisebb alatta
        // for (let i = 0; i < $scope.data.length; i += 5) {

        //   // az aktuális blokk nagy híre
        //   const bigItem = $scope.data[i];

        //   // a következő max 4 kisebb hír
        //   const smallItems = $scope.data.slice(i + 1, i + 5);

        //   // betoljuk egy csomagba
        //   $scope.groupedNews.push({
        //     big: bigItem,
        //     small: smallItems
        //   });
        // }
      })

      // ha bármi gebasz van a PHP-val vagy a hálózattal
      .catch(function(error) {
        console.error("Hiba a lekérésnél:", error);
      });

  }]);

})(window, angular);
