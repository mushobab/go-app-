resource "aws_lambda_function" "hello_world_lambda" {
  function_name = "hello-world-lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main"
  runtime       = "go1.x"
  filename      = "${path.module}/../build/hello-world.zip"

  source_code_hash = filebase64sha256("${path.module}/../build/hello-world.zip")
}