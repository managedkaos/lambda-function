provider "aws" {}

resource "aws_iam_role" "role" {
  name               = "lambda_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "script" {
  filename         = "script.zip"
  function_name    = "script"
  role             = aws_iam_role.role.arn
  runtime          = "python3.8"
  handler          = "script.lambda_handler"
  source_code_hash = filebase64sha256("script.zip")
}
