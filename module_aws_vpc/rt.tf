resource "aws_route_table" "route_table_publish" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = merge(
    var.common_tags,
    tomap({ Name = "${var.prefix}-public" })
  )
}

resource "aws_route_table_association" "vpc_association_publish" {
  count          = length(var.cidr_publish_subnet)
  subnet_id      = element(aws_subnet.subnets_publish.*.id, count.index)
  route_table_id = aws_route_table.route_table_publish.id
}

resource "aws_route_table" "route_table_private" {
  count  = var.nat_gateway_enabled == true ? length(var.cidr_publish_subnet) : 0
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_nat_gateway.nat_gw.*.id, count.index)
  }

  tags = merge(
    var.common_tags,
    tomap({ Name = "${var.prefix}-private-${count.index + 1}" })
  )
}

resource "aws_route_table_association" "vpc_association_private" {
  count          = var.nat_gateway_enabled == true ? length(var.cidr_publish_subnet) : 0
  subnet_id      = element(aws_subnet.subnets_private.*.id, count.index)
  route_table_id = element(aws_route_table.route_table_private.*.id, count.index)
}