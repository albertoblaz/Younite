if(!internal){
    if(!me) cancel("You must be logged", 401);
    if(me.role != 'site') cancel("You must be a disco user", 401);    
}

if(!internal){
    protect("idDisco");
    protect("date");
    protect('users');
} else {
    if(changed('users')){
        this.users = removeDups(this.users);
    }
}

function removeDups(vals){
    var actual = _.values(vals);
    return _.uniq(actual);
}
