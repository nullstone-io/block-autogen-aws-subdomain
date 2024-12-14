output "name" {
  value       = local.subdomain_name
  description = "string ||| The name that precedes the domain name for the created subdomain."
}

output "fqdn" {
  value       = local.fqdn
  description = "string ||| The FQDN (fully-qualified domain name) for the created subdomain."
}

output "zone_id" {
  value       = local.subdomain_zone_id
  description = "string ||| The zone ID of the AWS Route53 Zone for the created subdomain."
}

output "nameservers" {
  value       = local.subdomain_nameservers
  description = "list(string) ||| The list of nameservers of the AWS Route53 Zone for the created subdomain."
}

output "domain_name" {
  value       = local.subdomain_domain_name
  description = "string ||| The name of the root domain."
}
