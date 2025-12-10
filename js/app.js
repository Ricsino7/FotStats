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
    '$scope', '$http',
    function($scope,$http) {
      // Inicializálunk egy üres tömböt a home oldali adatok tárolására
    // Ide fogjuk betölteni a PHP-ból érkező JSON-t
    $scope.data = [];

    // Lekérjük az adatokat a home.php fájlból Angular $http segítségével
    $http.get('./php/matches.php') // az útvonal a PHP fájlhoz

        // Ha a lekérés sikeres, ezt a függvényt hívja meg
        .then(function(response) {

            // response.data tartalmazza a PHP által visszaadott JSON tömböt
            // Ezt betöltjük az Angular scope változójába
            // Így a HTML-ben az ng-repeat automatikusan frissíti a táblázatot
            $scope.data = response.data;

        })

        // Ha valami hiba történik a lekérés során, ezt a függvényt hívja meg
        .catch(function(error) {

            // Kiírjuk a konzolra a hibát, hogy lássuk mi ment rosszul
            console.error("Hiba a lekérésnél:", error);
        });
    }
  ])

  //Resulst controller
  .controller('resultsController', ['$scope', '$http', function($scope, $http) {

    // Inicializálunk egy üres tömböt a hírek tárolására
    // Ide fogja betölteni a PHP-ból érkező JSON adatokat
    $scope.data = [];

    // Lekérjük a híreket a PHP fájlból Angular $http segítségével
    $http.get('./php/results.php') // az útvonal a PHP fájlhoz

        // Ha a lekérés sikeres, ezt a függvényt hívja meg
        .then(function(response) {

            // response.data tartalmazza a PHP által visszaadott JSON tömböt
            // Ezt betöltjük az Angular scope változójába, így a HTML ng-repeat-je automatikusan frissül
            $scope.data = response.data;

        })

        // Ha valami hiba történik a lekérés során, ezt a függvényt hívja meg
        .catch(function(error) {

            // Kiírjuk a konzolra a hibát, hogy lássuk mi ment rosszul
            console.error("Hiba a lekérésnél:", error);
        });

}])

  //Rolunk controller
  .controller('rolunkController',[
    '$scope',
    function($scope) {
      $scope.teamMembers = [
            { name: 'Bokor Richárd', role: 'Projektvezető(Cégtulajodonos)', image : './img/ricsi.jpg'},
            { name: 'Kulcsár Tamás Ámon', role: 'Projektsegítő(Igazgató Úr)', image : './img/tomi.jpg'},
            
        ];

        $scope.aboutText = "Ez egy olyan oldal ami összehozza az embereket és a futball világát a futball világának híreivel és eredményeivel;)";
    }
  ])

.controller('newsController', ['$scope', '$http', function($scope, $http) {

    // Inicializálunk egy üres tömböt a hírek tárolására
    // Ide fogja betölteni a PHP-ból érkező JSON adatokat
    $scope.data = [];

    // Lekérjük a híreket a PHP fájlból Angular $http segítségével
    $http.get('./php/news.php') // az útvonal a PHP fájlhoz

        // Ha a lekérés sikeres, ezt a függvényt hívja meg
        .then(function(response) {

            // response.data tartalmazza a PHP által visszaadott JSON tömböt
            // Ezt betöltjük az Angular scope változójába, így a HTML ng-repeat-je automatikusan frissül
            $scope.data = response.data;
            

        })

        // Ha valami hiba történik a lekérés során, ezt a függvényt hívja meg
        .catch(function(error) {

            // Kiírjuk a konzolra a hibát, hogy lássuk mi ment rosszul
            console.error("Hiba a lekérésnél:", error);
        });

}])

//Home controller
.controller('homeController', ['$scope', '$http', function($scope, $http) {

    // Inicializálunk egy üres tömböt a home oldali adatok tárolására
    // Ide fogjuk betölteni a PHP-ból érkező JSON-t
    $scope.data = [];

    // Lekérjük az adatokat a home.php fájlból Angular $http segítségével
    $http.get('./php/home.php') // az útvonal a PHP fájlhoz

        // Ha a lekérés sikeres, ezt a függvényt hívja meg
        .then(function(response) {

            // response.data tartalmazza a PHP által visszaadott JSON tömböt
            // Ezt betöltjük az Angular scope változójába
            // Így a HTML-ben az ng-repeat automatikusan frissíti a táblázatot
            
          $scope.Ligak = [...new Set(response.data.map(x => x.Liga))];
          $scope.data=response.data;
          $scope.kivalasztott_tabella = "Premier League";
          $scope.$applyAsync();
        })
        // Ha valami hiba történik a lekérés során, ezt a függvényt hívja meg
        .catch(function(error) {

            // Kiírjuk a konzolra a hibát, hogy lássuk mi ment rosszul
            console.error("Hiba a lekérésnél:", error);
        });

}]);
})(window, angular);
