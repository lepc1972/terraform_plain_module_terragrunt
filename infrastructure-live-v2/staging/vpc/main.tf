provider "aws" {
    region = "us-east-2"
  
}
terraform {
    backend "local" {
        path = "staging/vpc/terraform.tfstate"
        
    }
  
}
module "vpc" {
    source = "../../../infrastructure-modules/vpc"
    env = "staging"
    azs = ["us-east-2a", "us-east-2b"]
    private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
    public_subnets = ["10.0.64.0/19", "10.0.96.0/19"]

    private_subnet_tags = {
        "kuberntes.io/cluster/staging-demo" = "owned"
        "kubernetes.io/role/internal-elb" = "1"
    }
    public_subnet_tags = {
        "kuberntes.io/cluster/staging-demo" = "owned"
        "kubernetes.io/role/elb" = "1"
    }
}