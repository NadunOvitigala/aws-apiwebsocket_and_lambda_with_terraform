resource "aws_iam_policy" "iam_policy_for_lambda" {
  name        = "lambda_policy"
  path        = "/"
  description = "lambda_policy"

  policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents",
       "execute-api:Invoke",
       "execute-api:ManageConnections",
       "apigateway:POST" 
     ],
     "Resource": [
       "arn:aws:logs:*:*:*",
       "arn:aws:execute-api:*:*:*"
     ],
     "Effect": "Allow"
   }
 ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
}