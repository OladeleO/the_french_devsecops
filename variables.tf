# Définition d'une variable pour la clé d'accès à la console AWS
# Cette clé est utilisée pour s'authentifier et effectuer des opérations dans AWS.
variable "access_key" {
    description = "Clé d'accès à la console AWS"
}

# Définition d'une variable pour la clé secrète de la console AWS
# Tout comme la clé d'accès, la clé secrète est nécessaire pour s'authentifier de manière sécurisée.
variable "secret_key" {
    description = "Clé secrète de la console AWS"
}

# Définition d'une variable pour spécifier la région AWS
# La région détermine où vos ressources AWS seront déployées géographiquement.
variable "region" {
    description = "Région AWS"
}

# Définition d'une variable pour l'endpoint email de la souscription SNS
# Cet endpoint sera utilisé pour recevoir des notifications par email à partir d'un sujet SNS.
variable "endpoint" {
  type = string # Spécifie que le type de cette variable est une chaîne de caractères.
  description = "La fameuse adresse email qui va recevoir la notification"
}	


