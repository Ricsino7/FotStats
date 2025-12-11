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
                  templateUrl: './html../layouts/root.html'
                },
                'header@root': {
                  templateUrl: './html../components/header.html',
                  controller:'headerController'
                },
                'footer@root': {
                  templateUrl: './html../components/footer.html'
                },
              }
            })

            .state('home', {
              url: '/?selectedLeague',
              parent: 'root',
              controller: 'homeController',
              templateUrl: './html../pages/home.html'
            })
            
            .state('matches', {
              url: '/matches',
              parent: 'root',
              controller : 'matchesController',
              templateUrl: './html../pages/matches.html'
            })

            .state('results', {
              url: '/results',
              parent: 'root',
              controller: 'resultsController',
              templateUrl: './html../pages/results.html'
            })

            .state('rolunk', {
              url: '/rolunk',
              parent: 'root',
              controller: 'rolunkController',
              templateUrl: './html../pages/rolunk.html'
            })

            .state('news', {
              url: '/news',
              parent: 'root',
              controller: 'newsController',
              templateUrl: './html../pages/news.html'
            })

           .state('lineup', {
               url: '/lineup?selectedTeam',
              parent: 'root',
              controller: 'lineupController',
              templateUrl: './html../pages/lineup.html'
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
 
})(window, angular);
