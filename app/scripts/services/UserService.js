'use strict';

angular.module('webApp.services')
  .factory('UserService', ['$rootScope', '$http', 'UserResource', '$location', function Userservice($root, $http, User, $location) {

    var api = {};
    var user;
    var ready = false;

    api.init = function(callback){
      if(ready) callback();
      else{
        user = User.getMe(function(){
          user.logged = user.hasOwnProperty('id');
          ready = true;
          callback()
        });
      }
    };

    api.login = function(userData, callback){
      $http.post('/discouser/login', userData)
        .success(function(data){
          user = User.getMe(function(){
            user.logged = true;
            callback(true);
          });
        })
        .error(function(){
          user = {id : '', username : '', logged : false};
          callback(false);
        });
    };

    api.logout = function(callback){
      $http.get('/discouser/logout')
        .success(function(){
          user = {id : '', username : '', logged : false};
          $location.path('/login');
        });
    };

    api.getUser = function(){
      return user;
    };

    return api;
  }])

  .factory('UserResource', function($resource){
    return $resource('/discouser/:userId',
      { userId:'@id' },
      {
        getMe : {method : 'GET', params : {userId : 'me'}}
      }
    );
  });
