module "cert" {
  source = "nullstone-modules/sslcert/aws"

  domain = {
    name    = aws_route53_zone.this.name
    zone_id = aws_route53_zone.this.zone_id
  }

  // Cannot use "depends_on" because it has a nested provider
  // By using tags from ns_autogen_subdomain_delegation info, we create a TF dependency
  tags = merge(data.ns_workspace.this.tags, { "SubdomainId" = ns_autogen_subdomain_delegation.to_aws.subdomain_id })

  enabled = var.create_cert
}
