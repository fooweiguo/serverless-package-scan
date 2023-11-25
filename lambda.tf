# Defines the lambda function code that will be zipped

data "archive_file" "lambda" {
  type        = "zip"
  source_dir = "./files/"
  output_path = "./files/${var.lambda_file_name}.zip"
}

# Defines the lambda function to be created using file

resource "aws_lambda_function" "own_lambda" {
  function_name    = var.lambda_function_name
  handler          = "lambda_function.lambda_handler"
  runtime          = "nodejs14.x"
  role              = aws_iam_role.iam_for_lambda.arn
  filename         = lambda_function.py                      # Adjust the path
  source_code_hash = lambda_function.output_base64sha256               # Adjust the path
}