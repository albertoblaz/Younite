if(!me) cancelAll("You must be logged", 401);
if(me.role != 'site') cancel("You must be a disco user", 401);

protect("idDisco");
protect("date");
