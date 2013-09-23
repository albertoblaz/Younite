'use strict';

angular.module('webApp.controllers')
  .controller('SignupCtrl', ['$scope', 'UserResource', '$location', function ($scope, User, $location) {
    $scope.user = {};
    $scope.signup = function(){
      //validation
      User.save($scope.user,
        function success(data){
          $location.path("/login");
        },
        function error(data){
          console.log(data);
        }
      );
    }
  }]);
