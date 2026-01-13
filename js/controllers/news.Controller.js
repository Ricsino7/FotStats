;(function(window, angular) {
  'use strict';

  angular.module('app')
  .controller('newsController', ['$scope', '$http', function($scope, $http) {

    $scope.data = [];
    $scope.groupedNews = [];

    $http.get('./php/news.php')
      .then(function(response) {
        $scope.data = response.data;
        $scope.groupedNews = [];

        // 1 nagy + 4 kicsi (FotMob stílus)
        for (let i = 0; i < $scope.data.length; i += 5) {
          const bigItem = $scope.data[i];
          const smallItems = $scope.data.slice(i + 1, i + 5);
            $scope.groupedNews.push({
              big: bigItem,
              small: smallItems
          });
        }
      })
      .catch(function(error) {
        console.error("Hiba a lekérésnél:", error);
      });

}]);

})(window, angular);
