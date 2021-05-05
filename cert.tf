module "cert" {
  source = "nullstone-modules/sslcert/aws"

  domain = {
    name    = aws_route53_zone.this.name
    zone_id = aws_route53_zone.this.zone_id
  }

  tags = data.ns_workspace.this.tags

  count = var.create_cert ? 1 : 0
}
