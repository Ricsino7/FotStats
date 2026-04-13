;(function(window, angular) {
  'use strict';
  // egy lekérdezést és egy requestet küldünk a phpnak
  angular.module('app')
  .controller('profileController',[
    '$scope', 'http','$rootScope','$state',
    function($scope,http,$rootScope,$state) {
      if (!$rootScope.user) {
        $state.go('home')
      }
      $scope.logout = () => {
       if (confirm("Biztosan Kiakarsz Jelntkezni?")) {
        $rootScope.user = null
        $state.go('home')
       }
        
      } 
      console.log($rootScope.user)
    }
  ]);


})(window, angular);
