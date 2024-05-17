resource "aws_eks_node_group" "eks_node_group" {
  tags            = merge(var.tags, {})
  node_role_arn   = aws_iam_role.node_group.arn
  node_group_name = var.cluster-name
  cluster_name    = aws_eks_cluster.main.name

  depends_on = [
    aws_iam_role_policy_attachment.iam_role_policy_attachment,
    aws_iam_role_policy_attachment.iam_role_policy_attachment4,
    aws_iam_role_policy_attachment.iam_role_policy_attachment2,
  ]

  scaling_config {
    min_size     = var.scaling.min
    max_size     = var.scaling.max
    desired_size = var.scaling.desired
  }

  subnet_ids = [
    aws_subnet.snet-1a.id,
    aws_subnet.snet-1b.id,
  ]
}

resource "aws_eks_cluster" "main" {
  tags     = merge(var.tags, {})
  role_arn = aws_iam_role.eks.arn
  name     = var.cluster-name

  depends_on = [
    aws_iam_role_policy_attachment.iam_role_policy_attachment3,
    aws_iam_role_policy_attachment.iam_role_policy_attachment5,
  ]

  vpc_config {
    security_group_ids = [
      aws_security_group.sg.id,
    ]
    subnet_ids = [
      aws_subnet.snet-1a.id,
      aws_subnet.snet-1b.id,
    ]
  }
}

