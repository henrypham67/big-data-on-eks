data "aws_lb" "default_alb" {
  tags = {
    "ingress.k8s.aws/stack" = "default"
  }

  depends_on = [kubectl_manifest.trino]
}

data "aws_route53_zone" "deploy_zone" {
  name         = var.domain_name
  private_zone = false
}

resource "aws_route53_record" "default_route" {
  zone_id = data.aws_route53_zone.deploy_zone.zone_id
  name    = "*.${var.domain_name}"
  type    = "CNAME"
  ttl     = "300"
  records = [data.aws_lb.default_alb.dns_name]
}