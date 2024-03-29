output "eks-endpoint" {
    value = aws_eks_cluster.aws_eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
    value = aws_eks_cluster.aws_eks.certificate_authority.0.data
}