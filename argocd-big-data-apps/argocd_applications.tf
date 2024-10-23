# OPA Server
resource "kubectl_manifest" "opa" {
  yaml_body = file("${path.module}/argocd_applications/opa.yaml")

  depends_on = [kubectl_manifest.big_data_project]
}

# Trino cluster
resource "kubectl_manifest" "trino" {
  yaml_body = templatefile(
    "${path.module}/argocd_applications/trino.yaml", //templating the argo cd application file
    {
      values = replace(
        templatefile(
          "${path.module}/../apps/trino/trino_values.yaml", //templating the values file
          {
            tls_certificate_arn = var.tls_certificate_arn
            domain_name = var.domain_name
          }
        ), "\n", "\n        ") // adding identation to yaml files
    }
  )

  depends_on = [kubectl_manifest.opa]
}

