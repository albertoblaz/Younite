'use strict';

angular.module('webApp.controllers', [])
  .controller('HeaderCtrl', ['$scope', 'UserService', function($scope, User){
    $scope.username = User;
    console.log(User);
  }]);
