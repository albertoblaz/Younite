'use strict'

angular.module('webApp.controllers')
  .controller('ProfileCtrl', ['$scope', 'UserService', function($scope, User){

    $scope.user = User.getUser();

    $scope.change = function(){
      User.logout();
    }
  }]);
