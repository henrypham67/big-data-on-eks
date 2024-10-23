terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.1"
    }
    argocd = {
      source  = "argoproj-labs/argocd"
      version = "7.0.3"
    }
  }
}

locals {
  eks_cluster_endpoint      = module.eks_cluster.eks_cluster_endpoint
  eks_certificate_authority = module.eks_cluster.eks_certificate_authority
  eks_cluster_name          = module.eks_cluster.eks_cluster_name
}

# AWS Provider
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

provider "helm" {
  kubernetes {
    host                   = local.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(local.eks_certificate_authority)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", local.eks_cluster_name, "--region", var.aws_region, "--profile", var.aws_profile]
      command     = "aws"
    }
  }
}

provider "kubernetes" {
  host                   = local.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(local.eks_certificate_authority)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", local.eks_cluster_name, "--region", var.aws_region, "--profile", var.aws_profile]
    command     = "aws"
  }
}

provider "argocd" {
  server_addr = "http://cicd.argocd-server.svc.cluster.local"
  username    = "admin"
  password    = "admin"
}