variable "subdomain" {
  type        = string
  description = "This represents the token to prepend the input domain block (i.e. the fqdn is represented by {var.subdomain}.<domain>.)"
}

variable "create_cert" {
  type        = bool
  description = "Enable this to create an SSL certificate through AWS ACM service."
  default     = true
}
