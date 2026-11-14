variable "region" {
  default = "ap-southeast-2"
}

variable "cluster_name" {
  default = "promed-eks"
}

variable "ecr_repository_names" {
  type = list(string)

  default = [
    "promed-main",
    "promed-dashboard",
    "promed-inventory",
    "promed-reports"
  ]
}
