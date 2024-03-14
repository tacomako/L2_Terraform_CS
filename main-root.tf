module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source        = "./EC2"
  subnet_ids    = module.vpc.subnet_ids
  L2sg_ssh_http = module.sg.L2sg_ssh_http
}

module "sg" {
  source = "./SG"
  vpc_id = module.vpc.vpc_id
}

output "instance_ids" {
  value = module.ec2.instance_ids
}