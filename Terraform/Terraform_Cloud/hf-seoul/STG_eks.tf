

# # # eks cluster IAM Role생성
# resource "aws_iam_role" "eks-cluster-role" {
#   name = "eks-cluster-role"

#   assume_role_policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "eks.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# POLICY
# }

# resource "aws_iam_role_policy_attachment" "cluster-AmazonEKSClusterPolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   role       = aws_iam_role.eks-cluster-role.name
# }

# resource "aws_iam_role_policy_attachment" "cluster-AmazonEKSVPCResourceController" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
#   role       = aws_iam_role.eks-cluster-role.name
# }

# eks-Cluster 생성
resource "aws_eks_cluster" "stg-k8s-cluster" {
  name     = "stg-k8s-cluster"
  role_arn = "arn:aws:iam::975050099328:role/eks-cluster-role"

  vpc_config {
    subnet_ids = [aws_subnet.STG-VPC-BASTION-PUB-2A.id, aws_subnet.STG-VPC-BASTION-PUB-2C.id,aws_subnet.STG-VPC-PRI-2A.id,aws_subnet.STG-VPC-PRI-2C.id]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
}

output "stg_endpoint" {
  value = aws_eks_cluster.stg-k8s-cluster.endpoint
}
