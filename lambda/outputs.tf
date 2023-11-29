output "connect_lambda_arn" {
  value = aws_lambda_function.connect.invoke_arn
}

output "sendmessage_lambda_arn" {
  value = aws_lambda_function.SendMessage.invoke_arn
}

output "disconnect_lambda_arn" {
  value = aws_lambda_function.disconnect.invoke_arn
}

output "connect_lambda_function_name" {
  value = aws_lambda_function.connect.function_name
}

output "sendmessage_lambda_function_name" {
  value = aws_lambda_function.SendMessage.function_name
}

output "disconnect_lambda_function_name" {
  value = aws_lambda_function.disconnect.function_name
}