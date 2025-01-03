output "eks_name" {
    description = "The name of the EKS cluster"
    value       = aws_eks_cluster.this.name

  
}
output "openid_provider_arn" {
    description = "The ARN of the OpenID Connect provider"
    value       = aws_iam_openid_connect_provider.this[0].arn
    depends_on  = [aws_iam_openid_connect_provider.this]

  
}
output "vpc_id" {
    description = "The ID of the VPC"
    value       = aws_vpc.this.id

  
}
output "private_subnet_ids" {
    description = "The IDs of the private subnets"
    value       = aws_subnet.private.*.id

  
}
output "public_subnet_ids" {
    description = "The IDs of the public subnets"
    value       = aws_subnet.public.*.id

  
}
output "eks_cluster_security_group_id" {
    description = "The ID of the security group for the EKS cluster"
    value       = aws_security_group.eks_cluster.id

  
}
output "eks_node_groups" {
    description = "The configuration for the EKS node groups"
    value       = var.node_groups

  
}

