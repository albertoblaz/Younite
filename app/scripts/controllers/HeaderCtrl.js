'use strict';

angular.module('webApp.controllers')
  .controller('HeaderCtrl', ['$scope', 'UserService', function($scope, User){
    $scope.username = User.getUser().name;

    $scope.logout = function(){
      User.logout();
    }
  }]);
