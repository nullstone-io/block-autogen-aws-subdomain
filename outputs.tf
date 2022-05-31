output "name" {
  value       = local.subdomain_dns_name
  description = "string ||| The name that precedes the domain name for the created subdomain."
}

output "fqdn" {
  value       = local.subdomain_fqdn
  description = "string ||| The FQDN (fully-qualified domain name) for the created subdomain."
}

output "zone_id" {
  value       = aws_route53_zone.this.zone_id
  description = "string ||| The zone ID of the AWS Route53 Zone for the created subdomain."
}

output "nameservers" {
  value       = aws_route53_zone.this.name_servers
  description = "list(string) ||| The list of nameservers of the AWS Route53 Zone for the created subdomain."
}

output "domain_name" {
  value       = local.subdomain_domain_name
  description = "string ||| The name of the root domain."
}
