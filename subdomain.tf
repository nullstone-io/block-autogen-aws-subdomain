data "ns_subdomain" "subdomain" {
  name = var.subdomain
}

locals {
  domain_name = data.ns_subdomain.subdomain.domain_name
  subdomain   = "${var.subdomain}.${local.domain_name}"
}

resource "aws_route53_zone" "this" {
  name = "${local.subdomain}.${local.domain_name}"
  tags = data.ns_workspace.this.tags
}

resource "ns_subdomain_delegation" "delegation" {
  subdomain_id = data.ns_subdomain.subdomain.id
  name_servers = aws_route53_zone.this.name_servers
}
