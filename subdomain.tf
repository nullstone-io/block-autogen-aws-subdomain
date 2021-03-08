data "ns_autogen_subdomain" "subdomain" {
  name = var.subdomain
}

resource "aws_route53_zone" "this" {
  name = data.ns_autogen_subdomain.subdomain.fqdn
  tags = data.ns_workspace.this.tags
}

resource "ns_autogen_subdomain_delegation" "to_aws" {
  subdomain   = var.subdomain
  nameservers = aws_route53_zone.this.name_servers
}
