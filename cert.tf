module "cert" {
  source = "nullstone-modules/sslcert/aws"

  domain = {
    name    = aws_route53_zone.this.name
    zone_id = aws_route53_zone.this.zone_id
  }

  tags = data.ns_workspace.this.tags

  // Cannot use "depends_on" because it has a nested provider
  // By using the resource, we can get the effect of depends_on
  enabled = var.create_cert && length(ns_autogen_subdomain_delegation.to_aws.nameservers) > 0
}
