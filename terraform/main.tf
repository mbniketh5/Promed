resource "aws_instance" "web" {
  ami           = "ami-0dd60a46ecc6eac16"
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}

module "vpc" {
  source = "./modules/vpc"
  #repository_name = "promed-repo"
}

module "iam" {
  source = "./modules/iam"
  #repository_name = "promed-repo"
}

module "ecr" {
  source          = "./modules/ecr"
  #repository_name =  "promed-repo"
}

module "eks" {
  source               = "./modules/eks"
  cluster_name         = "promed-repo"
  subnet_ids           = module.vpc.public_subnet_ids
  cluster_role_arn     = module.iam.eks_cluster_role_arn
  node_role_arn        = module.iam.eks_node_role_arn
}
