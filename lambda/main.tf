resource "aws_lambda_function" "connect" {
  filename      = "${path.module}/codes/Connect.zip"
  function_name = "Connect"
  role          = aws_iam_role.lambda_role.arn
  handler       = "Connect.lambda_handler"
  runtime       = "python3.8"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}

resource "aws_lambda_function" "SendMessage" {
  filename      = "${path.module}/codes/SendMessage.zip"
  function_name = "SendMessage"
  role          = aws_iam_role.lambda_role.arn
  handler       = "SendMessage.lambda_handler"
  runtime       = "python3.8"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}

resource "aws_lambda_function" "disconnect" {
  filename      = "${path.module}/codes/Disconnect.zip"
  function_name = "Disconnect"
  role          = aws_iam_role.lambda_role.arn
  handler       = "Disconnect.lambda_handler"
  runtime       = "python3.8"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}

resource "aws_lambda_function" "Broadcast" {
  filename      = "${path.module}/codes/Broadcast.zip"
  function_name = "Broadcast"
  role          = aws_iam_role.lambda_role.arn
  handler       = "Broadcast.lambda_handler"
  runtime       = "python3.8"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}

resource "aws_cloudwatch_log_group" "connect_logs" {
  name              = "/aws/lambda/${aws_lambda_function.connect.function_name}"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "sendmessage_logs" {
  name              = "/aws/lambda/${aws_lambda_function.SendMessage.function_name}"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "disconnect_logs" {
  name              = "/aws/lambda/${aws_lambda_function.disconnect.function_name}"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "broadcast_logs" {
  name              = "/aws/lambda/${aws_lambda_function.Broadcast.function_name}"
  retention_in_days = 30
}