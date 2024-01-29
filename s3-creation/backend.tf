terraform {
  backend "s3" {
    bucket = "pull-request-action-bucket"
    key    = "path/to/s3-creation/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "Git-Table"
  }
}
