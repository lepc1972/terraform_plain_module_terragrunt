terraform {
    source = "../../../infrastructure-modules/vpc"

}
include "root" {
    path = find_in_parent_folders()
}
inputs = {
    env = "dev"
    private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
    public_subnets = ["10.0.64.0/19", "10.0.96.0/19"]

    private_subnet_tags = {
        "kuberntes.io/cluster/dev-demo" = "owned"
        "kubernetes.io/role/internal-elb" = "1"
    }
    public_subnet_tags = {
        "kuberntes.io/cluster/dev-demo" = "owned"
        "kubernetes.io/role/elb" = "1"
    }

}