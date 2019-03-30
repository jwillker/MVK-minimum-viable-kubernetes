
# Configure the AWS Provider
provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY_ID}"
  secret_key = "${var.AWS_SECRET_ACCESS_KEY}"
  region     = "${var.AWS_DEFAULT_REGION}"
}

terraform {
  backend "s3" {
    bucket = "devopxlabs-terraform-state"
    key    = "kubernetes/terraform.tfstate"
    region = "us-east-1"
  }
}



