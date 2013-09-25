'use strict';

angular.module('webApp.controllers')
  .controller('MainCtrl', ['$scope', 'UserService', function ($scope, User) {

    $scope.step = false;

    $scope.musics = [{name: "Tango"},{name: "Walls"},{name: "Rock"}];
    $scope.ambients = [{name: "Tango"},{name: "Walls"},{name: "Rock"}];

    $scope.stepAhead = function(){
      $scope.step = !$scope.step;
    }

    if(!User.getUser().init){
      $scope.mainTemplate = "noDisco"
    } else {
      console.log('hola!');
    }

  }]);
