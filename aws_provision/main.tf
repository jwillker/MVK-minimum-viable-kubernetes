
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
resource "aws_instance" "k8s" {
  ami           = "ami-0565af6e282977273"
  instance_type = "t2.medium"
  count         = 3
  vpc_security_group_ids = ["${aws_security_group.kubernetes.id}"]
  key_name      = "${var.AWS_SSH_KEY_NAME}"
  
  tags {
    Name = "Kubernetes-Cluster"
  }
}

resource "aws_security_group" "kubernetes" {
  name = "kubernetes-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "public_ip" {
  value = "${aws_instance.k8s.*.public_ip}"
}
