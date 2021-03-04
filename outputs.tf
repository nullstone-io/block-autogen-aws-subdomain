output "name" {
  value       = aws_route53_zone.this.name
  description = "string ||| The created subdomain."
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
  value       = local.domain_name
  description = "string ||| The name of the root domain."
}

output "cert_arn" {
  value       = module.cert.certificate_arn
  description = "string ||| If var.create_cert is enabled, the ARN of the SSL Certificate."
}
