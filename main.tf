module "eks_cluster" {
  source      = "./eks-base-infra"
  aws_region  = var.aws_region
  aws_profile = var.aws_profile
}

module "eks_base_svcs" {
  source = "./eks-base-svcs"

  # AWS variables
  aws_region  = var.aws_region
  aws_profile = var.aws_profile

  # EKS variables
  eks_cluster_name          = module.eks_cluster.eks_cluster_name
  eks_cluster_endpoint      = module.eks_cluster.eks_cluster_endpoint
  eks_certificate_authority = module.eks_cluster.eks_certificate_authority

  # VPC variables
  eks_vpc_id = module.eks_cluster.eks_vpc_id

  # Route53 variables
  domain_name = var.domain_name

  depends_on = [module.eks_cluster]
}