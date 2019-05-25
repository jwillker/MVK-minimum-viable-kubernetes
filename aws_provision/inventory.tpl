[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/users/jhonn/code/bastion_key.pem
ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[masters]
master ansible_host=${k8s_master_ip}

[nodes]
${k8s_nodes_ip}