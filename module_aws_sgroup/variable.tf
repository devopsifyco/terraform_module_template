variable "vpc_id" {}
variable "prefix" {}
variable "common_tags" {}

variable "ingress_rules" {
  default = []
} // 80,443,22

variable "egress_rules" {
  default = []
} // 80,443,22

variable "ingress_cidr_blocks" {
  default = []
}

variable "egress_cidr_blocks" {
  default = []
}