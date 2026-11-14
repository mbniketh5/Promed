#EKS Cluster
resour*e "aws_eks_node_group" "nodes" {

* cluster_name = aws_eks_cluster.ek*.name

  node_group_name = "promed*workers"

  node_role_arn = var.no*e_role_arn

  subnet_ids = var.subnet_ids

  scaling_config {

    desired_size = 2

    max_size = 3

    min_size = 1
  }

  instance_types = ["m7i-flex.large"]
}

#Managed Node Group
resour*e "aws_eks_node_group" "nodes" {

* cluster_name = aws_eks_cluster.ek*.name

  node_group_name = "promed*workers"

  node_role_arn = var.no*e_role_arn

  subnet_ids = var.subnet_ids

  scaling_config {

    desired_size = 2

    max_size = 3

    min_size = 1
  }

  instance_types = ["m7i-flex.large"]
}
