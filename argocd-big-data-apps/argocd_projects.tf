resource "kubectl_manifest" "big_data_project" {
  yaml_body = file("${path.module}/argocd_projects/big_data.yaml")
}