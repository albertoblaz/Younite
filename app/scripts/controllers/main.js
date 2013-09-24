'use strict';

angular.module('webApp.controllers')
  .controller('MainCtrl', ['$scope', 'UserService', function ($scope, User) {

    $scope.step = false;

    $scope.stepAhead = function(){
      console.log('hola!!');
      $scope.step = !$scope.step;
    }

    if(!User.getUser().init){
      $scope.mainTemplate = "noDisco"
    } else {
      console.log('hola!');
    }

  }]);
