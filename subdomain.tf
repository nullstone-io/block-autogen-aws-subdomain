data "ns_autogen_subdomain" "subdomain" {
  name = var.subdomain
}

locals {
  domain_name = data.ns_autogen_subdomain.subdomain.domain_name
  subdomain   = "${var.subdomain}.${local.domain_name}"
}

resource "aws_route53_zone" "this" {
  name = "${local.subdomain}.${local.domain_name}"
  tags = data.ns_workspace.this.tags
}

resource "ns_autogen_subdomain_delegation" "to_aws" {
  subdomain   = var.subdomain
  nameservers = aws_route53_zone.this.name_servers
}
