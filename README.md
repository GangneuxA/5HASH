# 5HASH

⚠️ **Attention** : Ce projet Terraform ne fonctionne que sur des machines Windows.

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
export TF_VAR_mysql_root_password=somesecret
```

### Déploiement

Une fois dans le dossier d'environnement voulue et les variables export on peut commencer le déploiement de l'infrastrucutre par Terraform.

#### Commandes Terraform 

1. **Initialisez le projet pour télécharger les plugins**
```Bash
terraform init
```
2. **Visualiser le plan d'exécution**
```Bash
terraform plan
```
3. **Déploiement de l'infrastructure**
```Bash
terraform deploy
```
4. **Détruire l'infrastructure**
```Bash
terraform destroy
```

#### Scalabilités et Variables

Il est possible d'augmenter et de réduire le nombre de ressource pour chaques modules depuis le dossier d'environnement : 

*   Par le fichier `main.tf` pour modifier le nombre de réplicat MySQL : modification de la ligne `mysql_replica_count`

*   Par le fichier `variables.tf` pour modifier le nombre de réplicat des NGNIX et PrestaShop : modification de la variable `replica_count`

*   Vous pouvez modifier toutes autres variables dans le `main.tf` ou le `variables.tf` pour modifier les valeurs de l'infrastructure. 

On fois les valeurs modifiées il vous suffira de faire un : 
```Bash
terraform plan
```
Pour visualiser les modifications et enfin :
```Bash
terraform deploy
```
Pour déployé la nouvelle infrastructure

## Auteurs 

*   **GANGNEUX Alexis**
*   **BOISGARD Julien**