variable "domain_name" {
  description = "domain name (or application name if no domain name available)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "tags for all the resources, if any"
}

variable "hosted_zone" {
  default     = null
  description = "Route53 hosted zone"
}

variable "acm_certificate_domain" {
  default     = null
  description = "Domain of the ACM certificate"
}

variable "price_class" {
  default     = "PriceClass_100" // Only US,Canada,Europe
  description = "CloudFront distribution price class"
}

variable "use_default_domain" {
  default     = false
  description = "Use CloudFront website address without Route53 and ACM certificate"
}

variable "upload_sample_file" {
  default     = false
  description = "Upload sample html file to s3 bucket"
}

# All values for the TTL are important when uploading static content that changes
# https://stackoverflow.com/questions/67845341/cloudfront-s3-etag-possible-for-cloudfront-to-send-updated-s3-object-before-t
variable "cloudfront_min_ttl" {
  default     = 0
  description = "The minimum TTL for the cloudfront cache"
}

variable "cloudfront_default_ttl" {
  default     = 86400
  description = "The default TTL for the cloudfront cache"
}

variable "cloudfront_max_ttl" {
  default     = 31536000
  description = "The maximum TTL for the cloudfront cache"
}

variable "cloudfront_geo_restriction_restriction_type" {
  default     = "none"
  description = "The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist."
  validation {
    error_message = "Can only specify either none, whitelist, blacklist"
    condition     = can(regex("^(none|whitelist|blacklist)$", var.cloudfront_geo_restriction_restriction_type))
  }

}

variable "cloudfront_geo_restriction_locations" {
  default     = []
  description = "The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist)."
}

variable "logging_bucket" {
  type        = string
  description = "An existing bucket to log requests to, null if no logging"
  default     = ""
}

variable "logging_prefix" {
  type        = string
  description = "A prefix for the logging_bucket, null if not used"
  default     = ""
}

variable "configure_website" {
  type        = bool
  description = "Set false to not add a bucket website configuration"
  default     = true
}

variable "distribution_response_page_path" {
  type        = string
  description = "Error response page path, default to '/'"
  default     = "/"
}
