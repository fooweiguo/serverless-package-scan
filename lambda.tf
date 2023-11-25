# Defines the lambda function code that will be zipped

data "archive_file" "lambda" {
  type        = "zip"
  source_dir = "./files/"
  output_path = "./files/${var.lambda_file_name}.zip"
}

# Defines the lambda function to be created using file

resource "aws_lambda_function" "own_lambda" {
  function_name    = "lambda_function"
  handler          = "lambda_function.lambda_handler"
  runtime          = "nodejs14.x"
  role              = aws_iam_role.iam_for_lambda.arn
  filename         = "files.zip"                      # Adjust the path
  source_code_hash = data.archive_file.lambda.output_base64sha256               # Adjust the path
}