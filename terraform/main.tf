resource "aws_instance" "web" {
  ami           = "ami-0dd60a46ecc6eac16"
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}

module "vpc" {
  source = "./modules/vpc"
}

module "iam" {
  source = "./modules/iam"
}

module "ecr" {
  source               = "./modules/ecr"
  repository_names     = var.ecr_repository_names
}

module "eks" {
  source               = "./modules/eks"

  cluster_name         = var.cluster_name

  subnet_ids           = module.vpc.public_subnet_ids

  cluster_role_arn     = module.iam.eks_cluster_role_arn

  node_role_arn        = module.iam.eks_node_role_arn
}
