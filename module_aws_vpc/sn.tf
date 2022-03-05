resource "aws_subnet" "subnets_publish" {
  count                   = length(var.availability_zone)
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block              = element(var.cidr_publish_subnet, count.index)
  availability_zone       = element(var.availability_zone, count.index)

  tags = merge(
    var.common_tags,
    tomap({ Name = "${var.prefix}-publish-${count.index + 1}" })
  )
}

resource "aws_subnet" "subnets_private" {
  count                   = length(var.availability_zone)
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block              = element(var.cidr_private_subnet, count.index)
  availability_zone       = element(var.availability_zone, count.index)

  tags = merge(
    var.common_tags,
    tomap({ Name = "${var.prefix}-private-${count.index + 1}" })
  )
}