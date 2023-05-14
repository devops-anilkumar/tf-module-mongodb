# RETRIVES THE INFORMATION FROM THE REMOTE STATE FILE
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "state-terraformbucket"
    key = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

#FETCHING THE SECRETS FROM SECRET MANNAGER
data "aws_secretsmanager_secret" "secrets" {
  name = "roboshop/secrets"
}


data "aws_secretsmanager_secret_version" "secrets" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}


# output "example" {
#   value = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["DOCDB_USERNAME"]
# }