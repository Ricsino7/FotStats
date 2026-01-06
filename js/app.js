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
        $rootScope.languageTranslations = {
  hu: "Magyar 🇭🇺",
  en: "English 🇺🇸",
  de: "Deutsch 🇩🇪"
};

// get languages
$rootScope.getLanguages = function () {
  fetch('./php/getLanguages.php')
    .then(res => res.json())
    .then(res => {
      if (res.error) {
        console.error(res.error);
        return;
      }

      // csak a szükséges nyelvek
      $rootScope.languages = res.data
        .filter(l => ['hu', 'en', 'de'].includes(l.language))
        .map(l => ({
          ...l,
          data: JSON.parse(l.data)
        }));

      // alapértelmezett: magyar
      const defaultLang = $rootScope.languages.find(l => l.language === 'hu');
      if (defaultLang) {
        $rootScope.currentLang = defaultLang.data;
        $rootScope.currentFlag = defaultLang.language;
      }

      $rootScope.$applyAsync();
    })
    .catch(err => console.error(err));
};

// run
$rootScope.getLanguages();

$rootScope.selectedLanguage = function (langData) {
  const lang = $rootScope.languages.find(l => l.data === langData);
  if (lang) {
    $rootScope.currentLang = lang.data;
    $rootScope.currentFlag = lang.language;
  }
};

      }
    ])
 
})(window, angular);
