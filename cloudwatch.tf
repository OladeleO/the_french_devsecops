############ Création d'un événement CloudWatch ############
# Cette ressource définit une règle CloudWatch pour surveiller les changements d'état des instances EC2.
resource "aws_cloudwatch_event_rule" "event" {
  name        = "ChangementEtatEC2" # Nom de la règle d'événement, pour identification.
  description = "ChangementEtatEC2" # Description de la règle, pour clarification.
  event_pattern = <<EOF
{
  "source": [
    "aws.ec2" 
  ],
  "detail-type": [
    "EC2 Instance State-change Notification"
  ]
}
EOF
}

# Création d'une cible pour l'événement CloudWatch
# Cette ressource configure une cible pour la règle CloudWatch, ici un sujet SNS pour envoyer les notifications.
resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.event.name # La règle CloudWatch à laquelle cette cible est associée.
  target_id = "EnvoyerVersSNS" # Identifiant unique pour la cible, pour référence.
  arn       = aws_sns_topic.topic.arn # ARN du sujet SNS vers lequel les notifications seront envoyées.
}

### Event_pattern
# Le type de détail de l'événement, ici les notifications de changement d'état de l'instance EC2.  "EC2 Instance State-change Notification"

# Spécifie la source de l'événement, ici les instances EC2. "aws.ec2"
