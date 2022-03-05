resource "aws_eip" "eip" {
  count = var.nat_gateway_enabled == true ? length(var.cidr_publish_subnet) : 0
  vpc   = true

  tags = merge(
    var.common_tags,
    tomap({ Name = "${var.prefix}-public-${count.index + 1}" })
  )
}

resource "aws_nat_gateway" "nat_gw" {
  count         = var.nat_gateway_enabled == true ? length(var.cidr_publish_subnet) : 0
  allocation_id = element(aws_eip.eip.*.id, count.index)
  subnet_id     = element(aws_subnet.subnets_publish.*.id, count.index)

  tags = merge(
    var.common_tags,
    tomap({ Name = "${var.prefix}-public-${count.index + 1}" })
  )
}