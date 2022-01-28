module "ec2_dephix_virtulization_engine" {
    source = "https://github.com/StackGuardian/terraform-aws-ec2-instance.git?ref=v3.3.0"
    name = var.ec2_name
    ami = var.ami
    associate_public_ip_address = var.associate_public_ip_address
    availability_zone = var.availability_zone
}

module "ssh_key_pair_dephix_engine" {
    source = "https://github.com/StackGuardian/terraform-aws-key-pair.git?ref=vv1.0.1"
    key_name = var.key_name
    tags = var.key_pair_tags
}

resource "aws_eip" "this" {
    vpc = var.vpc
    instance = var.instance
    network_interface = var.network_interface
    associate_with_private_ip = var.associate_with_private_ip
    tags = var.eip_tags
    public_ipv4_pool = var.public_ipv4_pool
}

# Deploy internally with a static private IP

# resource "route53" "this" {
    
# }

# module "security_group_dephix_engine" {
#     source = "https://github.com/StackGuardian/terraform-aws-security-group.git"
# }


# resource "acm" {
    
# }