'use strict';

angular.module('webApp.services')
  .factory('UserService', ['$http', 'UserResource', function Userservice($http, User) {

    var api = {};

    var user = User.getMe(function(){
      console.log(user.id);
      user.logged = user.hasOwnProperty('id');
    });

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
