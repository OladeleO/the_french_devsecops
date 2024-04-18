################## Lancement d'une instance EC2 ##################
# Cette ressource crée une instance EC2 dans AWS, qui peut servir de serveur web ou d'autres usages selon la configuration.
resource "aws_instance" "web-server" {
    ami             = "ami-01cc34ab2709337aa" # ID de l'AMI (Amazon Machine Image) à utiliser pour l'instance.
    instance_type   = "t2.micro" # Type de l'instance, ici "t2.micro", qui définit les ressources matérielles (CPU, mémoire, etc.).
    key_name        = aws_key_pair.french_key.key_name # Nom de la paire de clés associée à l'instance pour SSH.
    security_groups = ["${aws_security_group.web-server.name}"] # Groupes de sécurité associés à l'instance.
    tags = {
        Name = "FauxServerWeb" # Étiquette (tag) pour l'instance, facilitant son identification.
    }
}

############ Création du groupe de sécurité pour EC2 ############
# Ce groupe de sécurité définit les règles de trafic entrant et sortant pour l'instance EC2.
resource "aws_security_group" "web-server" {
    name        = "FauxServerWeb" # Nom du groupe de sécurité.
    description = "Allow incoming HTTP Connections" # Description du groupe de sécurité.
    ingress { # Configuration des règles de trafic entrant.
        from_port   = 22 # Port d'origine pour le trafic entrant (SSH).
        to_port     = 22 # Port de destination pour le trafic entrant (SSH).
        protocol    = "tcp" # Protocole utilisé, ici TCP.
        cidr_blocks = ["0.0.0.0/0"] # Permet le trafic entrant de n'importe quel bloc CIDR, soit tout internet.
    }
    egress { # Configuration des règles de trafic sortant.
        from_port   = 0 # Le trafic peut partir de n'importe quel port.
        to_port     = 0 # Le trafic peut être destiné à n'importe quel port.
        protocol    = "-1" # Autorisation de tous les protocoles pour le trafic sortant.
        cidr_blocks = ["0.0.0.0/0"] # Permet le trafic sortant vers tous les blocs CIDR, couvrant ainsi tout internet.
    }
}			

############ Création d'une paire de clés pour EC2 ############
# Création d'une clé privée TLS qui sera utilisée pour générer une paire de clés SSH.
resource "tls_private_key" "example" {
  algorithm = "RSA" # Algorithme utilisé pour générer la clé. Ici, RSA.
  rsa_bits  = 4096 # Nombre de bits pour la clé RSA. Ici, 4096 pour plus de sécurité.
}
# Création d'une paire de clés dans AWS pour l'authentification SSH à l'instance EC2.
resource "aws_key_pair" "french_key" {
  key_name   = "TheFrenchKey" # Nom de la paire de clés.
  public_key = tls_private_key.example.public_key_openssh # Clé publique générée à partir de la clé privée TLS.
}

