provider "aws" {
  region = var.AWS_REGION
}

data "aws_region" "current" {
}

data "aws_availability_zones" "available" {
}

provider "http" {
}


provider "kubernetes" {
  host                      = aws_eks_cluster.aws_eks.endpoint
  cluster_ca_certificate    = base64decode(aws_eks_cluster.aws_eks.certificate_authority.0.data )
  token                     = data.aws_eks_cluster_auth.aws_iam_authenticator.token
}

provider "helm" {
  kubernetes {
  host                   = aws_eks_cluster.tf_eks.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.aws_eks.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.aws_iam_authenticator.token
  }
}