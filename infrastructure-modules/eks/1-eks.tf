resource "aws_iam_role" "eks" {
    name = "$(var.env)-$(var.eks_name)-eks-cluster"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect = "Allow"
            Principal = {
            Service = "eks.amazonaws.com"
            }
            Action = "sts:AssumeRole"
        },
        ]
    })
  
}

resource "aws_iam_role_policy_attachment" "eks" {
    role       = aws_iam_role.eks.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_eks_cluster" "this" {
    name     = "${var.env}-${var.eks_name}"
    role_arn = aws_iam_role.eks.arn
    version = var.eks_version

    vpc_config {
        subnet_ids = var.subnet_ids
        endpoint_private_access = false
        endpoint_public_access = true
    }
    depends_on = [ aws_iam_role_policy_attachment.eks ]
}
