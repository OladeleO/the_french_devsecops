# ############ Création d'un sujet SNS ############
# Cette ressource permet de créer un sujet SNS (Simple Notification Service) dans AWS.
# Le nom du sujet est défini à "MyServerMonitor".
resource "aws_sns_topic" "topic" {
  name = "MaPetiteBalance"
}

# ############ Création d'une souscription au sujet SNS ############
# Cette ressource permet de s'abonner au sujet SNS créé précédemment.
# La souscription utilise le protocole "email", signifiant que les notifications seront envoyées par email.
# L'endpoint (adresse email) pour recevoir les notifications est spécifié par la variable "endpoint".
resource "aws_sns_topic_subscription" "topic-subscription" {
  topic_arn = aws_sns_topic.topic.arn # ARN du sujet SNS auquel on s'abonne.
  protocol  = "email" # Le protocole de la souscription, ici "email".
  endpoint  = var.endpoint # L'adresse email spécifiée pour recevoir les notifications.
}

# Création d'une politique pour le sujet SNS
# Cette politique définit les permissions associées au sujet SNS, en spécifiant qui peut publier des messages.
resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.topic.arn # ARN du sujet SNS à qui la politique s'applique.
  policy = data.aws_iam_policy_document.sns_topic_policy.json # La politique IAM sous forme de document JSON.
}

# Définition du document de politique IAM pour le sujet SNS
# Ce document spécifie les actions autorisées sur le sujet SNS, ici la publication de messages ("SNS:Publish").
data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    effect  = "Allow" # Permet l'action spécifiée.
    actions = ["SNS:Publish"] # Action autorisée: publication de messages sur le sujet SNS.
    principals {
      type        = "Service" # Le type de principal autorisé à effectuer l'action, ici un service AWS.
      identifiers = ["events.amazonaws.com"] # Identifiant du service autorisé, ici le service Amazon EventBridge.
    }
    resources = [aws_sns_topic.topic.arn] # ARN du sujet SNS sur lequel l'action est autorisée.
  }
}
