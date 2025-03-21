locals {
  argocd_namespace = "argocd"
}

resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = local.argocd_namespace
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.6.12"

  values = [
    templatefile(
      "${path.module}/argocd-templates/argocd_values.yaml",
      {
        argocd_global_domain = "localhost"
      }
    )
  ]

  depends_on = [
    helm_release.aws_lbc
    , kubectl_manifest.namespaces
  ]
}

# Route 53 record to ArgoCD ingress
data "kubernetes_ingress_v1" "argocd_ingress" {
  metadata {
    name      = "argocd-server"
    namespace = local.argocd_namespace
  }
  depends_on = [helm_release.argocd]
}