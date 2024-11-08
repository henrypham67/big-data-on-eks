resource "kubectl_manifest" "big_data_project" {
  yaml_body = file("${path.module}/argocd_projects/big_data.yaml")
}

resource "kubectl_manifest" "base_applications_project" {
  yaml_body = file("${path.module}/argocd_projects/base_applications.yaml")
}