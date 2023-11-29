resource "aws_iam_policy" "api_gateway_policy" {
  name        = "api_gateway_policy"
  path        = "/"
  description = "api_gateway_policy"

  policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents",
       "lambda:InvokeFunction"
     ],
     "Resource": "*",
     "Effect": "Allow"
   }
 ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.apigateway_role.name
  policy_arn = aws_iam_policy.api_gateway_policy.arn
}