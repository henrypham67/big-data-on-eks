module "eks_cluster" {
  source      = "./eks-base-infra"
  aws_region  = var.aws_region
  aws_profile = var.aws_profile
}

module "eks_base_svcs" {
  source = "./eks-base-svcs"

  # EKS variables
  eks_cluster_name = module.eks_cluster.eks_cluster_name

  # VPC variables
  eks_vpc_id = module.eks_cluster.eks_vpc_id

  depends_on = [module.eks_cluster]
}

module "argocd_applications" {
  source = "./argocd-apps"

  depends_on = [module.eks_base_svcs]
}