# Gestion des Ressources AWS avec Terraform

Ce dépôt contient les configurations Terraform pour déployer et gérer des ressources AWS, incluant EC2, SNS, et CloudWatch.

## Fonctionnalités
- **EC2**: Lancement et configuration d'instances EC2 avec sécurité et clés SSH.
- **SNS**: Création de sujets SNS pour la notification par e-mail.
- **CloudWatch**: Surveillance des changements d'état des instances EC2.

## Démarrage rapide
Pour utiliser ce projet, clonez le dépôt et initialisez Terraform avec `terraform init`, puis appliquez la configuration avec `terraform apply`.

## Contribution
Les contributions sont les bienvenues. Veuillez soumettre vos pull requests sur GitHub.

Merci d'utiliser ce dépôt pour vos besoins de gestion AWS avec Terraform!


# Configuration du fichier `terraform.tfvars`

Ce fichier contient les valeurs de configuration essentielles pour utiliser Terraform avec vos ressources AWS.

## Informations d'identification AWS
```hcl
access_key = "votre_cle_d_acces_aws"
secret_key = "votre_cle_secrete_aws"
region = "eu-west-1"
```

Assurez-vous de remplacer les valeurs des clés access_key, secret_key, et endpoint par vos propres informations avant d'utiliser ce fichier dans votre environnement Terraform