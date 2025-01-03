variable "env" {
    description = "The environment name"
    type        = string
  
}
variable "vpc_cidr_block" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
  
}
variable "azs" {
    description = "The availability zones for subnets"
    type        = list(string)
    default     = ["us-east-2a", "us-east-2b", "us-east-2c"]

  
}
variable "private_subnets" {
    description = "The CIDR ranges for the private subnets"
    type        = list(string)
}
variable "public_subnets" {
    description = "The CIDR ranges for the public subnets"
    type        = list(string)
}
variable "private_subnet_tags" {
    description = "The tags for the private subnets"
    type        = map(any)
  
}
variable "public_subnet_tags" {
    description = "The tags for the public subnets"
    type        = map(any)
  
}
variable "eks_name" {
    description = "The name of the EKS cluster"
    type        = string
    default     = "eks"
  
}
variable "eks_version" {
    description = "The version of the EKS cluster"
    type        = string
    default     = "1.21"
  
}
variable "subnet_ids" {
    description = "The subnet IDs for the EKS cluster"
    type        = list(string)
  
}
variable "nodes_iam_policies" {
    description = "The IAM policies to attach to the EKS nodes"
    type        = list(string)
    default = {
        1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
        2 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
        3 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
        4 = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    }
  
}
variable "node_groups" {
    description = "The configuration for the EKS node groups"
    type        = map(object({
        instance_type = string
        desired_size  = number
        max_size      = number
        min_size      = number
    }))
  
}   
variable "enable_irsa" {
    description = "Whether to enable IRSA for the EKS cluster"
    type        = bool
    default     = false
  
}   

