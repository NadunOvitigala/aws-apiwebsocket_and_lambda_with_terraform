provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.28.0"
    }
  }
}

module "lambda" {
  source = "./lambda"
}

module "api_gateway" {
  source = "./api_gateway"
  connect_integration_uri   = module.lambda.connect_lambda_arn
  disconnect_integration_uri   = module.lambda.disconnect_lambda_arn
  sendmessage_integration_uri   = module.lambda.sendmessage_lambda_arn
  connect_lambda_function_name = module.lambda.connect_lambda_function_name
  disconnect_lambda_function_name = module.lambda.disconnect_lambda_function_name
  sendmessage_lambda_function_name = module.lambda.sendmessage_lambda_function_name
}