# 5HASH

## Structure du projet 

### Environnements 

Trois environnements sont disponible pour déployer l'infrastructure.

*   devel : Environnement de développement.
*   staging : Environnement de pré-production.
*   prod : Environnement de production.

Chaque environnement sont constitués de la même façon :
*   Un fichier main.tf : Le fichier principal qui permet la définition des ressources à déployer.
*   Un fichier variables.tf : Permet de définir des variables d'entrée spécifiques à l'environnement. 

### Modules 

windows 

export TF_VAR_admin_passwd=somesecret
export TF_VAR_mysql_password=somesecret
export TF_VAR_mysql_root_password=somesecret