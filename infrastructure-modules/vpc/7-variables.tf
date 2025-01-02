variable "env" {
    description = "The environment name"
    type        = string
  
}
variable "vpc_cidr_block" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
  
}