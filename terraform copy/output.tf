output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

output "GestionIP" {
  value = aws_instance.GestionStore.public_ip
}

output "StoreIP" {
  value = aws_instance.StoreWordpress.public_ip
}
