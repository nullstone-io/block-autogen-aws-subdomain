resource "ns_autogen_subdomain" "autogen_subdomain" {
  subdomain_id = data.ns_workspace.this.block_id
  env_id       = data.ns_workspace.this.env_id
}

locals {
  subdomain_domain_name = ns_autogen_subdomain.autogen_subdomain.domain_name
  subdomain_dns_name    = ns_autogen_subdomain.autogen_subdomain.dns_name
  subdomain_fqdn        = ns_autogen_subdomain.autogen_subdomain.fqdn
}

resource "aws_route53_zone" "this" {
  name = local.subdomain_fqdn
  tags = local.tags
}

resource "ns_autogen_subdomain_delegation" "to_aws" {
  subdomain_id = data.ns_workspace.this.block_id
  env_id       = data.ns_workspace.this.env_id
  nameservers  = aws_route53_zone.this.name_servers
}
