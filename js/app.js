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
           .state('root', {
             abstract: true,
             views: {
              '@': {
                 templateUrl: './html/root.html'
               },
              'header@root': {
                 templateUrl: './html/header.html',
                 controller:'headerController'
               },
              'footer@root': {
                templateUrl: './html/footer.html'
              },
             }
           })

          .state('home', {
            url: '/',
            parent: 'root',
            controller: 'homeController',
            templateUrl: './html/home.html'
          })
          
          .state('matches', {
            url: '/matches',
            parent: 'root',
            controller : 'matchesController',
            templateUrl: './html/matches.html'
          })

          .state('results', {
            url: '/results',
            parent: 'root',
            controller: 'resultsController',
            templateUrl: './html/results.html'
          })

          .state('rolunk', {
            url: '/rolunk',
            parent: 'root',
            controller: 'rolunkController',
            templateUrl: './html/rolunk.html'
          })

          .state('tournaments', {
            url: '/tournamenst',
            parent: 'root',
            controller: 'tournamentsController',
            templateUrl: './html/tournaments.html'
           })

          .state('news', {
            url: '/news',
            parent: 'root',
            controller: 'newsController',
            templateUrl: './html/news.html'
          })

        $urlRouterProvider.otherwise('/');
      }
    ])

    //Application run
    .run([
      '$rootScope',
      ($rootScope) => {
        $rootScope.darkMode = "dark";
      }
    ])
    
    //Home controller létrehozásának ellenőrzése
    .controller('homeController', [
    '$scope',
    function($scope) {
      console.log('fasf')
      
    }
  ])
 
  //Dark and Light mode gomb létre hozása, müködövé tétele
  .controller('headerController',[
    '$rootScope',
    '$scope',
    function($rootScope, $scope){
      $scope.toggleTheme = function() {
        $rootScope.darkMode = $rootScope.darkMode === "dark" ? "light" : "dark";
      }
    }
  ])

  //Matches controller

  .controller('matchesController',[
    '$scope',
    function($scope) {
      console.log('Fso')
    }
  ])

  //Resulst controller
  .controller('resultsController',[
    '$scope',
    function($scope) {
      console.log('Fdas')
    }
  ])

  //Rolunk controller
  .controller('rolunkController',[
    '$scope',
    function($scope) {
      console.log('Fdasasd')
    }
  ])

  //Tournaments controller
  .controller('tournamentsController',[
    '$scope',
    function($scope) {
      console.log('Fdasasdas')
    }
  ])

  //News controller
  .controller('newsController',[
    '$scope',
    function($scope) {
      console.log('Fdasasdasasd')
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
