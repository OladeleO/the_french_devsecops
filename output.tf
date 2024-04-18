# Définition d'une sortie pour l'ID de l'instance EC2
# Cette sortie renvoie l'ID de l'instance EC2 créée, permettant de l'identifier facilement dans AWS.
output "instance_id" {
  description = "ID de l'instance EC2" # Description de la sortie.
  value       = aws_instance.web-server.id # La valeur retournée est l'ID de l'instance EC2 nommée "web-server".
}

# Définition d'une sortie pour l'ARN du sujet SNS
# Cette sortie renvoie l'ARN (Amazon Resource Name) du sujet SNS créé, utilisé pour identifier le sujet dans AWS.
output "topic_arn" {
  description = "ARN du sujet SNS" # Description de la sortie.
  value       = aws_sns_topic.topic.arn # La valeur retournée est l'ARN du sujet SNS.
}

# Définition d'une sortie pour l'ARN de la règle CloudWatch
# Cette sortie renvoie l'ARN de la règle CloudWatch créée, utilisée pour déclencher des actions basées sur des conditions spécifiques.
output "event_name" {
  description = "ARN de la règle CloudWatch" # Description de la sortie.
  value       = aws_cloudwatch_event_rule.event.arn # La valeur retournée est l'ARN de la règle CloudWatch nommée "event".
}
