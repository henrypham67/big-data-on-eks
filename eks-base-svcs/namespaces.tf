locals {
  namespaces = [
    "argocd"
    ,"external-secrets"
    ,"kafka"
    ,"opa"
    ,"trino"
  ]
}

resource "kubectl_manifest" "namespaces" {
    for_each = local.namespaces
    yaml_body = <<YAML
apiVersion: v1
kind: Namespace
metadata:
  name: ${each.value}
YAML
}