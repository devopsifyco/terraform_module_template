output "vpc_id" {
  value     = aws_vpc.main.id
  sensitive = false
}

output "subnet_publish" {
  value = aws_subnet.subnets_publish[*].id
}

output "subnets_private" {
  value = aws_subnet.subnets_private[*].id
}

output "publish_subnets_cidr_blocks" {
  value = aws_subnet.subnets_publish[*].cidr_block
}

output "private_subnets_cidr_blocks" {
  value = aws_subnet.subnets_private[*].cidr_block
}