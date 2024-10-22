terraform {
  required_providers {
    argocd = {
      source = "argoproj-labs/argocd"
      version = "7.0.3"
    }
  }
}

# AWS Provider
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

provider "helm" {
  kubernetes {
    host                   = var.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(var.eks_certificate_authority)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.eks_cluster_name, "--region", var.aws_region, "--profile", var.aws_profile]
      command     = "aws"
    }
  }
}

provider "kubernetes" {
  host                   = var.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(var.eks_certificate_authority)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", var.eks_cluster_name, "--region", var.aws_region, "--profile", var.aws_profile]
    command     = "aws"
  }
}

provider "argocd" {
  server_addr = "http://cicd.argocd-server.svc.cluster.local"
  username    = "admin"
  password    = "admin"
}