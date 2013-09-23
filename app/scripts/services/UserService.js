'use strict';

angular.module('webApp.services')
  .factory('UserService', ['$http','$cookieStore', function Userservice($http, $cookie) {

    var api = {};

    var user = $cookie.get("younite-user-logged") || {id : '', username : '', logged : false};

    api.login = function(userData, callback){
      $http.post('/discouser/login', userData)
        .success(function(data){
          console.log(data);
          user.id = data.uid;
          user.logged = true;
          user.username = userData.username;
          user.sid = userData.username;
          $cookie.put("younite-user-logged", user);
          $cookie.put("sid", user.sid);
          callback(true);
        })
        .error(function(){
          user = {id : '', username : '', logged : false};
          $cookie.remove("younite-user-logged");
          $cookie.remove("sid");
          callback(false);
        });
    };

    api.logout = function(callback){
      $http.get('/discouser/logout')
        .success(function(){
          user = {id : '', username : '', logged : false};
          $cookie.remove("younite-user-logged");
          callback(true);
        });
    };

    api.getId = function(){
      return user.id;
    };

    api.isLogged = function(){
      return user.logged;
    };

    console.log(api);

    return api;
  }])

  .factory('UserResource', function($resource){
    return $resource('/discouser/:userId',
      { userId:'@id' }
    );
  });
