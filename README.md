## MVK - Minimum Viable Kubernetes (not production ready)

## The problem

**I need to do a quick deploy of cluster k8s to test something, validate a proof of concept, etc**

What options do you have?

1. [Kops](https://github.com/kubernetes/kops)

2. [Kubespray](https://github.com/kubernetes-sigs/kubespray)

3. [Kubeadm](http://kubernetes.io/docs/admin/kubeadm/)

4. Or this entire [list](https://github.com/ramitsurana/awesome-kubernetes#installers)

## The solution

**I can use any solution ready, or I can make my own!**

And that's what I did

Using packer to build a ami with all requirements to deploy a k8s cluster.

Terraform to provision all necessary infra in aws.

Ansible to run post-provision the cluster and join nodes

## Benefits

- Simple

- Functional

- Fast to deploy and destroy


## How to use:

#### Prerequisites

1. AWS account
2. Packer
3. Ansible
4. Terraform

#### Running:
   
    $ export AWS_KEYPAIR_NAME=name AWS_KEYPAIR_FILE=path to file
    $ cd base_image && packer build packer.json
    $ cd aws_provision && terraform init && terraform apply -auto-approve 
    $ cd kubeadm_create && ansible-playbook -i hosts master.yml && ansible-playbook -i hosts nodes.yml  
    
    
#### To destroy:

    $ cd aws_provision && terraform destroy -auto-approve

    #Delete the ami provisioned by Packer 
    $ aws ec2 deregister-image --image-id 'ami-id'

##
* You can also use Gitlab CI. Just clone this repo to a Gitlab namespace and use.

* There's a `.gitlab-ci.yml` file with all steps to deploy this project.

## Contributions

- Only improvements

- I do not want to put new features, the idea here is to stay simple.
