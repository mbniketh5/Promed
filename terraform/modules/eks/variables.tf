variable "cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS"
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "IAM Role ARN for EKS Cluster"
  type        = string
}

variable "node_role_arn" {
  description = "IAM Role ARN for Worker Nodes"
  type        = string
}

variable "node_group_name" {
  description = "EKS Node Group Name"
  type        = string
  default     = "promed-node-group"
}

variable "instance_types" {
  description = "EC2 instance types for Worker Nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}
