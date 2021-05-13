module "cert" {
  source = "nullstone-modules/sslcert/aws"

  domain = {
    name    = aws_route53_zone.this.name
    zone_id = aws_route53_zone.this.zone_id
  }

  tags    = data.ns_workspace.this.tags
  enabled = var.create_cert

  depends_on = [ns_autogen_subdomain_delegation.to_aws]
}
