if(!me) cancelAll("Unauthorized", 403);

var self = this;
var _ = require('underscore');

hide('owner');

self.loving = _.contains(me.sites, self.id);

if(query.hasOwnProperty('getUsers')){
    dpd.users.get({id : {$in: self.users}}, function(users, error){
        self.users = users;
    });
}