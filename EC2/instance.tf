#Make EC2 Instance (resoucre "aws_instance" "name")

resource "aws_instance" "ec2-ruop" {
    count = length(var.subnet_ids)
    ami = var.ami
    instance_type = var.chassis
    key_name = var.keyname
    availability_zone = var.az
    security_groups = [var.L2sg_ssh_http]
    subnet_id = var.subnet_ids[count.index]
    tags = { Name = "ec2-ruop" }
    user_data = file("C:\\Users\\denis\\Documents\\Sheridan\\2024\\Cloud Systems\\Assign 2\\EC2\\user-data.sh")
}

output "instance_ids" {
  value = aws_instance.ec2-ruop[*].id
}