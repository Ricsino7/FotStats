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

        .state('login', {
          url: '/login',
          parent: 'root',
          controller: 'loginController',
          templateUrl: './html../pages/login.html'
        })

        .state('register', {
          url: '/register',
          parent: 'root',
          controller: 'registerController',
          templateUrl: './html../pages/register.html'
        })

        .state('bet', {
          url: '/bet',
          parent: 'root',
          controller: 'betController',
          templateUrl: './html../pages/bet.html'
        })

        .state('statement', {
          url: '/statement',
          parent: 'root',
          controller: 'statementController',
          templateUrl: './html../pages/statement.html'
        });

      $urlRouterProvider.otherwise('/');
    }
  ])
    //Application run
    .run([
      '$rootScope','util',
      ($rootScope,util) => {

        $rootScope.lang = { id: 'hu' };
        $rootScope.getLanguageData = () => {
          fetch(`./lang/${$rootScope.lang.id}.json`)
          .then(r => r.json())
          .then(r => {
            console.log(util.getPageId())
            $rootScope.lang.data = r;
            $rootScope.$applyAsync();
          })
          .catch(e => console.log(e));
        }
        $rootScope.getLanguageData();
      }
    ])
 
})(window, angular);
