# module_aws_sgroup

this is module for aws security group    

## Getting started  
config git credentical for private repo       
href: https://wahlnetwork.com/2020/08/11/using-private-git-repositories-as-terraform-modules/        
create block local to define prefix and tag for resource         
```
locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = "${terraform.workspace}"
    Project     = "${var.project}"
    Owner       = "${var.contact}"
    ManagedBy   = "Terraform"
  }
}
```

add module example   
```

module "sg" {
  source              = "git::https://gitlab.com/t3774/module_aws_sgroup.git"
  common_tags         = local.common_tags
  prefix              = local.prefix
  vpc_id              = vpc.id
  ingress_rules       = [80, 443, 22, 1433]
  egress_rules        = [80, 443, 22, 1433]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
}
```
# output   
```
output "sg_id" {
  value     = aws_security_group.main.id
  sensitive = false
}
```
# name of rescoure   
```
Name = "${var.prefix}-security_group"
```