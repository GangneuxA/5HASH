# 5HASH

## Structure du projet 

### Environnements 

Trois environnements sont disponible pour déployer l'infrastructure.

*   **devel** : Environnement de développement.
*   **staging** : Environnement de pré-production.
*   **prod** : Environnement de production.

Chaque environnement sont constitués de la même façon :
*   Un fichier `main.tf` : Le fichier principal qui permet la définition des ressources à déployer.
*   Un fichier `variables.tf` : Permet de définir des variables d'entrée spécifiques à l'environnement. 

### Modules 

Dans le dossier `modules/` on retrouve trois composants réutilisables pour définir l'infrastructure :

**mysql**

*   `main.tf` : Contient la configuration des ressources MySQL.
*   `outputs.tf` : Contient les sorties exposées pour le module.
*   `provider.tf` : Contient le provider utilisé.
*   `variables.tf` : Contient les variables nécessaires au module. 

**nginx**

*   `main.tf` : Contient la configuration des ressources NGNIX.
*   `outputs.tf` : Contient les sorties exposées pour le module.
*   `provider.tf` : Contient le provider utilisé.
*   `variables.tf` : Contient les variables nécessaires au module. 
*   `nginx.conf.tpl` : Contient un modèle de configuration pour NGNIX. 

**prestashop**

*   `main.tf` : Contient la configuration des ressources PrestaShop.
*   `outputs.tf` : Contient les sorties exposées pour le module.
*   `provider.tf` : Contient le provider utilisé.
*   `variables.tf` : Contient les variables nécessaires au module. 

## Démarrage

### Prérequis

*   Terraform doit être installé sur la machine.
*   Docker doit être installé sur la machine.

### Environnement

Choissisez votre environnement de déploiement :

```Bash
cd "environnement"
```

### Mots de Passes

Avant de pouvoir déployer l'infrastructure il faut mettre en place les variables d'environnements suivantes : 

```Bash
export TF_VAR_admin_passwd=somesecret
export TF_VAR_mysql_password=somesecret
export TF_VAR_mysql_root_password=
```

### Déploiement

Windows