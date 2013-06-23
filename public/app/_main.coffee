disco =
    name: "Kapital"
    description: "Makelele me toca el telele, je"
    city: "Madrid"
    address: "Calle de Atocha, 80"
    picture: "assets/images/logos/kapital.png"
    style: "Pachangueo"
    users: []
    events: []
    owner: "Grupo Kapital"

Lungo.ready ->
    siteCont = new SitesController "section#sites"
    Site.create name: "Kapital 1", description: "1"
    Site.create name: "Kapital 2", description: "2"
    Site.create name: "Kapital 3", description: "3"
    Site.create name: "Kapital 4", description: "4"

