'use strict';

angular.module('webApp.controllers')
  .controller('MainCtrl', function ($scope, $http) {

    $scope.templates = {
      "header" : "views/tplHeader.html",
      "navigation" : "views/tplNavigation.html",
      "footer" : "views/tplFooter.html"
    }

    $http({withCredentials: true, method: 'GET', url: '/discouser/me'}).

      success(function(data, status, headers, config) {
        $scope.response = data;
      }).
      error(function(data, status, headers, config) {
         console.log(headers);
        $scope.response = status;
      });
  });
