data "ns_subdomain" "this" {
  stack_id = data.ns_workspace.this.stack_id
  block_id = data.ns_workspace.this.block_id
  env_id   = data.ns_workspace.this.env_id
}

locals {
  fqdn                  = data.ns_subdomain.this.fqdn
  subdomain_domain_name = data.ns_subdomain.this.domain_name
}

resource "aws_route53_zone" "this" {
  name = trimsuffix(local.fqdn, ".")
  tags = local.tags
}

locals {
  subdomain_name        = aws_route53_zone.this.name
  subdomain_zone_id     = aws_route53_zone.this.zone_id
  subdomain_nameservers = aws_route53_zone.this.name_servers
}

resource "ns_autogen_subdomain_delegation" "to_aws" {
  subdomain_id = data.ns_workspace.this.block_id
  env_id       = data.ns_workspace.this.env_id
  nameservers  = aws_route53_zone.this.name_servers
}
