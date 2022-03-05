resource "aws_vpc" "main" {
  cidr_block                       = var.cidr_block
  instance_tenancy                 = "default"
  enable_dns_support               = "true"
  enable_dns_hostnames             = "true"
  enable_classiclink               = "false"
  assign_generated_ipv6_cidr_block = false

  tags = merge(
    var.common_tags,
    tomap({ Name = "${var.prefix}-vpc" })
  )
}
