module "cert" {
  source = "./cert"

  domain = {
    name    = aws_route53_zone.this.name
    zone_id = aws_route53_zone.this.zone_id
  }

  tags = data.ns_workspace.this.tags
}
