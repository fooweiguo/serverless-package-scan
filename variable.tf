variable lambda_function_name {
    description     = "Name of lambda function"
    type            = string
    default         = "lambda_function"
}

variable lambda_file_name {
    description     = "Name of lambda file to be zipped"
    type            = string
    default         = "index"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = "vpc-02c3cea2893bac90f"
}

variable "sg_id" {
    description = "The security group id"
    type        = string
    default     = "sg-05ff8047411fe813c"
}
