data "ns_subdomain" "subdomain" {
  stack = data.ns_workspace.this.stack
  block = data.ns_workspace.this.block
}

resource "ns_autogen_subdomain" "autogen_subdomain" {
  subdomain_id = data.ns_subdomain.id
  env = data.ns_workspace.this.env
}

resource "aws_route53_zone" "this" {
  name = ns_autogen_subdomain.autogen_subdomain.fqdn
  tags = data.ns_workspace.this.tags
}

resource "ns_autogen_subdomain_delegation" "to_aws" {
  subdomain_id = data.ns_subdomain.id
  env = data.ns_workspace.this.env
  nameservers = aws_route53_zone.this.name_servers
}
