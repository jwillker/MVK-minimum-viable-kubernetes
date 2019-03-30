output "k8s_masters_public_ip" {
  value = "${aws_instance.k8s_masters.*.public_ip}"
}

output "k8s_nodes_public_ip" {
  value = "${aws_instance.k8s_nodes.*.public_ip}"
}
