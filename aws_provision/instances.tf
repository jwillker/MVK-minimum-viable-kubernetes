resource "aws_instance" "k8s_masters" {
  ami           = "ami-0565af6e282977273"
  instance_type = "t2.medium"
  count         = 1
  vpc_security_group_ids = ["${aws_security_group.kubernetes.id}"]
  key_name      = "${var.AWS_SSH_KEY_NAME}"
  
  tags {
    Name = "k8s-master-${count.index}"
  }
}

resource "aws_instance" "k8s_nodes" {
  ami           = "ami-0565af6e282977273"
  instance_type = "t2.medium"
  count         = 2
  vpc_security_group_ids = ["${aws_security_group.kubernetes.id}"]
  key_name      = "${var.AWS_SSH_KEY_NAME}"
  
  tags {
    Name = "k8s-node-${count.index}"
  }
}
