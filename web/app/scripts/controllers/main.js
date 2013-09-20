'use strict';

angular.module('webApp.controllers')
  .controller('MainCtrl', function ($scope, $http) {
    $http({withCredentials: true, method: 'GET', url: 'http://localhost:2403/discouser/me'}).
    success(function(data, status, headers, config) {
      $scope.response = data;
    }).
    error(function(data, status, headers, config) {
       console.log(headers);
      $scope.response = status;
    });
  });
