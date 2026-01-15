;(function(window, angular) {
  'use strict';

  // app modulhoz tartozó newsController
  angular.module('app')
  .controller('news2Controller', [
    '$scope',
    '$element',
    '$timeout',
    '$http', 
    function($scope, $element, $timeout, $http) {

      // hírek lekérése backendről
      $http.get('./php/news.php')
      .then(function(response) {

        // teljes hír lista eltárolása
        $scope.data = response.data;
        $scope.$applyAsync();
      })

      // ha bármi gebasz van a PHP-val vagy a hálózattal
      .catch(function(error) {
        console.error("Hiba a lekérésnél:", error);
      });

      $scope.swapWithBig = (small_index) => {
        let big_index = Math.floor(small_index / 5) * 5,
            temp = $scope.data[big_index];
        $scope.data[big_index] = $scope.data[small_index];
        $scope.data[small_index] = temp;
        $scope.$applyAsync();
      };
    }
  ]);

})(window, angular);
