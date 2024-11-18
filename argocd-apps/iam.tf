# External Secrets Operator

data "aws_iam_policy_document" "eso_trust_relationship" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}

resource "aws_iam_role" "external_secret_operator" {
  name               = "ExternalSecretsOperator"
  assume_role_policy = data.aws_iam_policy_document.eso_trust_relationship.json
}

resource "aws_iam_policy" "external_secret_operator_secrets_access" {
  policy = file("./argocd-apps/iam_policies/external_secrets_operator.json")
  name   = "ExternalSecretOperatorSecretsAccess"
}

resource "aws_iam_role_policy_attachment" "external_secret_operator" {
  policy_arn = aws_iam_policy.external_secret_operator_secrets_access.arn
  role       = aws_iam_role.external_secret_operator.name
}

resource "aws_iam_role_policy_attachment" "external_secret_operator_ecr" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
  role       = aws_iam_role.external_secret_operator.name
}

resource "aws_eks_pod_identity_association" "external_secret_operator" {
  cluster_name    = "big-data-on-eks"
  namespace       = "external-secrets"
  service_account = "external-secrets"
  role_arn        = aws_iam_role.external_secret_operator.arn
}