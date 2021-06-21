resource "ns_autogen_subdomain" "autogen_subdomain" {
  subdomain_id = data.ns_workspace.this.block_id
  env_id       = data.ns_workspace.this.env_id
}

resource "aws_route53_zone" "this" {
  name = ns_autogen_subdomain.autogen_subdomain.fqdn
  tags = data.ns_workspace.this.tags
}

resource "ns_autogen_subdomain_delegation" "to_aws" {
  subdomain_id = data.ns_workspace.this.block_id
  env_id       = data.ns_workspace.this.env_id
  nameservers  = aws_route53_zone.this.name_servers
}
