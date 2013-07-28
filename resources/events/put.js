if(!internal){
    if(!me) cancel("You must be logged", 401);
    if(me.role != 'site') cancel("You must be a disco user", 401);    
}

if(!internal){
    protect("idDisco");
    protect("date");
    protect('users');
    protect('siteName');
}
