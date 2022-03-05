variable "prefix" {
  type = string
  default = ""
}
variable "cidr_block" {
  type = string
  default = ""
} // 10.0.0.0/24
variable "cidr_publish_subnet" {
  type = list(string)
  default = [] // 10.0.0.0/25 
}
variable "cidr_private_subnet" {
  type = list(string)
  default = [] // 10.0.0.0/25 
}
variable "cidr_block_subnet" {
  type = list(string)
  default = [] // 10.0.0.0/25 
}
variable "availability_zone" {
  type = list(string)
  default = [] //us-east-2a
}
variable "common_tags" {
  type = map
  default = {}
}
variable "nat_gateway_enabled" {
  type        = bool
  description = "Flag to enable/disable NAT Gateways to allow servers in the private subnets to access the Internet"
}