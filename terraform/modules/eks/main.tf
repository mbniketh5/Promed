#EKS Cluster
resource "aws_eks_node_group" "nodes" {

cluster_name = aws_eks_cluster.eks.name

  node_group_name = "promed_workers"

  node_role_arn = var.node_role_arn

  subnet_ids = var.subnet_ids

  scaling_config {

    desired_size = 2

    max_size = 3

    min_size = 1
  }

  instance_types = ["m7i-flex.large"]
}

#Managed Node Group
resource "aws_eks_node_group" "nodes" {

cluster_name = aws_eks_cluster.eks.name

  node_group_name = "promed_workers"

  node_role_arn = var.node_role_arn

  subnet_ids = var.subnet_ids

  scaling_config {

    desired_size = 2

    max_size = 3

    min_size = 1
  }

  instance_types = ["m7i-flex.large"]
}
