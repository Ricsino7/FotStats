(function (window, angular) {

  'use strict';

  // Application module
  angular.module('app', [
    'ui.router',
    'app.common'
  ])
  .config([
      '$stateProvider',
      '$urlRouterProvider',
      ($stateProvider, $urlRouterProvider) => {

        $stateProvider
          // .state('root', {
          //   abstract: true,
          //   views: {
          //     '@': {
          //       templateUrl: './html/root.html'
          //     },
          //     'header@root': {
          //       templateUrl: './html/header.html'
          //     },
          //     'footer@root': {
          //       templateUrl: './html/footer.html'
          //     },
          //     'modal@root': {
          //       templateUrl: './html/modal.html'
          //     }
          //   }
          // })

          .state('home', {
            url: '/',
            controller: 'homeController',
            templateUrl: './html/home.html'
          })

          // .state('matches', {
          //   url: '/matches',
          //   //controller: 'matchesController',
          //   templateUrl: './html/matches.html'
          // })

          // .state('results', {
          //   url: '/results',
          //   //controller: 'resultsController',
          //   templateUrl: './html/results.html'
          // })

          // .state('login', {
          //   url: '/login',
          //   //controller: 'loginController',
          //   templateUrl: './html/login.html'
          // })

          // .state('register', {
          //   url: '/register',
          //   //controller: 'registerController',
          //   templateUrl: './html/register.html'
          // })

          // .state('profile', {
          //   url: '/profile',
          //   // controller: 'profileController',
          //   templateUrl: './html/profile.html'
          // })

          // .state('rolunk', {
          //   url: '/rolunk',
          //   //controller: 'rolunkController',
          //   templateUrl: './html/rolunk.html'
          // })

          // .state('tournaments', {
          //   url: '/tournamenst',
          //   //controller: 'tournamentsController',
          //   templateUrl: './html/tournaments.html'
          // })

        $urlRouterProvider.otherwise('/');
      }
    ])

    .run([
      '$rootScope',
      ($rootScope) => {
        $rootScope.darkMode = "dark";
      }
    ])
    
    .controller('homeController', [
    '$rootScope',
    '$scope',
    function($rootScope, $scope) {

			$scope.toggleTheme = function() {
        $rootScope.darkMode = $rootScope.darkMode === "dark" ? "light" : "dark";
      }
    }
  ])



  // .controller('homeController',function($scope,$window) {
       
  //       $scope.homeImages = [];   
  //       var vm = this;
  //       vm.isDarkMode = false;

  //       // Ha van elmentett beállítás, betöltjük
  //       if ($window.localStorage.getItem('theme') === 'dark') {
  //         vm.isDarkMode = true;
  //       }

  //       vm.toggleTheme = function() {
  //         vm.isDarkMode = !vm.isDarkMode;
  //         if (vm.isDarkMode) {
  //           $window.localStorage.setItem('theme', 'dark');
  //         } else {
  //           $window.localStorage.setItem('theme', 'light');
  //         }
  //       };
  //     });
})(window, angular);
