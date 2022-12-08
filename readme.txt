Pour sauvegarder la base de donnée utiliser dans le terminal la commande :
mysqldump -u root -p cinema.sql


Pour restaurer la base de données : 
mysqldump -u root -p cinema.sql > cinemadump.sql

Ce qui a crée un fichier qui permet la restauration de la BDD.


Pour utiliser ce fichier afin de restaurer la base de donnée il suffit d’utiliser la commande inverse : 
mysqldump -u root -p cimema.sql  < cinemadump.sql

Ce qui aura pour effet de restaurer la base de données telle qu’elle était au moment du dump.
