data "aws_ami" "k8s-base" {
  most_recent = true

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Name"
    values = ["K8s-base-Packer-Ansible"]
  }
  owners    = ["967724168372"]
}

resource "aws_instance" "k8s_masters" {
  ami           = "${data.aws_ami.k8s-base.id}"
  instance_type = "t2.medium"
  count         = 1
  vpc_security_group_ids = [
    "${aws_security_group.k8s-ssh.id}",
    "${aws_security_group.k8s-master-sg.id}"
  ]

  key_name      = "${var.AWS_SSH_KEY_NAME}"

  tags {
    Name = "k8s-master-${count.index}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "k8s_nodes" {
  ami           = "${data.aws_ami.k8s-base.id}"
  instance_type = "t2.medium"
  count         = 2
  vpc_security_group_ids = [
    "${aws_security_group.k8s-ssh.id}",
    "${aws_security_group.k8s-node-sg.id}"
  ]

  key_name      = "${var.AWS_SSH_KEY_NAME}"

  tags {
    Name = "k8s-node-${count.index}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
