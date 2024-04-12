# Configuration du fournisseur AWS
# Cette section configure Terraform pour utiliser le fournisseur AWS avec des détails spécifiques à votre compte.
provider "aws" {
    region     = "${var.region}" # Spécifie la région AWS où les ressources seront déployées. La valeur est tirée de la variable "region".
    access_key = "${var.access_key}" # La clé d'accès pour s'authentifier auprès d'AWS. La valeur provient de la variable "access_key".
    secret_key = "${var.secret_key}" # La clé secrète correspondant à la clé d'accès, utilisée pour l'authentification. La valeur est tirée de la variable "secret_key".
}
