# External Secrets Operator
resource "kubectl_manifest" "external_secrets_operator" {
  yaml_body = templatefile(
    "${path.module}/argocd_applications/external_secrets_operator.yaml", //templating the argo cd application file
    {
      values = replace(
        templatefile(
          "${path.module}/../apps/external_secrets_operator/external_secrets_operator_values.yaml", //templating the values file
          {
            tls_certificate_arn = var.tls_certificate_arn
            domain_name = var.domain_name
          }
        ), "\n", "\n        ") // adding identation to yaml files
    }
  )

  depends_on = [kubectl_manifest.base_applications_project]
}

# External Secrets
resource "kubectl_manifest" "external_secrets" {
  yaml_body = file("${path.module}/argocd_applications/external_secrets.yaml")

  depends_on = [kubectl_manifest.external_secrets_operator]
}