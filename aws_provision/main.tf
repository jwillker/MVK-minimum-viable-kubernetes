
# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Need provision a s3 bucket before to use:
#terraform {
#  backend "s3" {
#    bucket = "devopxlabs-terraform-state"
#    key    = "kubernetes/terraform.tfstate"
#    region = "us-east-1"
#  }
#}



