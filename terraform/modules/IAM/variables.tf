variable "cluster_role_name" {
  description = "EKS Cluster Role Name"
  type        = string
  default     = "eks-cluster-role"
}

variable "node_role_name" {
  description = "EKS Node Group Role Name"
  type        = string
  default     = "eks-node-role"
}
