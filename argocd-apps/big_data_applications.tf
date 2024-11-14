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

  depends_on = [
    kubectl_manifest.opa
    ,kubectl_manifest.external_secrets_operator
  ]
}

# Strimzi Operator
resource "kubectl_manifest" "strimzi_operator" {
  yaml_body = templatefile(
    "${path.module}/argocd_applications/strimzi_operator.yaml", //templating the argo cd application file
    {
      values = file("${path.module}/../apps/kafka/strimzi_operator_values.yaml")
    }
  )

  depends_on = [
    kubectl_manifest.opa
    ,kubectl_manifest.external_secrets_operator
  ]
}

# Kafka Cluster
resource "kubectl_manifest" "kafka_cluster" {
  yaml_body = file("${path.module}/argocd_applications/kafka_cluster.yaml")

  depends_on = [kubectl_manifest.big_data_project]
}