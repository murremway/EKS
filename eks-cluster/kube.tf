data "aws_eks_cluster_auth" "aws_iam_authenticator" {
  name = "${aws_eks_cluster.aws_eks.name}"
}

locals {
  # roles to allow kubernetes access via cli and allow ec2 nodes to join eks cluster
  configmap_roles = [{
    rolearn  ="${aws_iam_role.eks_nodes.arn}"
    username = "{{SessionName}}"
    groups   = ["system:masters"]
  },
  {
    rolearn  = "${aws_iam_role.eks_cluster.arn}"
    username = "system:node:{{EC2PrivateDNSName}}"
    groups   = ["system:bootstrappers","system:nodes"]
  },
    {
    rolearn  = "${aws_iam_role.eks_nodes.arn}"
    username = "{{SessionName}}"
    groups   = ["system:masters"]
  },]
}