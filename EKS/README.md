# Provision EKS cluster with Terraform

## Requirements
 - AWS cli
 - terraform command line
 - helm
 - kubectl : to connect to cluster

## let's go
This code will provision 3 node EKS cluster with support for LB<br/>
Clone the repository: [checkout_code]("git@github.com:sameer1701/terraform-mgmt.git")<br/>
Adjust values from values file as per your need<br/>

Run below commands, verify terraform plan and go for apply <br/>
EKS is chargeable, it's not free
```
 - terraform init
 - terraform plan
 - terraform apply

```

After 15-20 mins you will have your cluster <br/>
Then connect to cluster using below command
```
  aws eks --region <Region_code> update-kubeconfig --name <cluster_name>
  kubectl get node
```
