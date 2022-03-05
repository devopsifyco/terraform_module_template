resource "aws_security_group" "main" {
  vpc_id      = var.vpc_id
  description = "${var.prefix}-security_group"

  # allow ingress
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      cidr_blocks = var.ingress_cidr_blocks
      protocol    = "tcp"
    }
  }

  # allow egress
  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      cidr_blocks = var.egress_cidr_blocks
      protocol    = "tcp"
    }
  }

  tags = merge(
    var.common_tags,
    tomap({ Name = "${var.prefix}-security_group" })
  )
} 