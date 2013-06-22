if(!me) cancelAll("Unauthorized", 403);

var self = this;
hide('owner');

if(query.hasOwnProperty('getUsers')){
    dpd.users.get({id : {$in: self.users}}, function(users, error){
        self.users = users;
    });
}