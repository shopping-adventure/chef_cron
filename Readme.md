# Cookbook cron
A simple dedicated cookbooks to put cronjob easily.  
A cron is attributs set that have to be on node/databags apps or role.  

Un cookbook spécifique à la mise en place des crons.  
Un cron est un ensemble d'attribut à définir dans une node/role/apps ou autre :  
  
    node["cron"]["NAME"] = nom du cron
    node["cron"]["NAME"]["active"] = "true" => activation
    node["cron"]["NAME"]["minute"]
    node["cron"]["NAME"]["hour"]
    node["cron"]["NAME"]["day"]
    node["cron"]["NAME"]["month"]
    node["cron"]["NAME"]["jour"] = weekday
    node["cron"]["NAME"]["user"]
    node["cron"]["NAME"]["path"] = forme ":chemin"
    node["cron"]["NAME"]["shell"]
    node["cron"]["NAME"]["command"]

## Usage
Better way is too define all attributs into node/role or apps.  
Le mieux est de définir l'ensemble des attributs dans un role/app ou node.

So any node which have :  
Ainsi tout serveur qui aura un attribut:  
    
    node["cron"]["name"]["active"] = "true"
    
will have its cronjob setup, any other value will delete the cronjob (or do nothing).  
aura le cron de déployé, et pour tout autre valeur le cron d'effacé.  

