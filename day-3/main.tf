provider "aws" {
  region = "ap-south-1"
}

# referencing the module that is already created
module "ec2_instance" {
  source = "./modules/ec2_instance"

  ami_value           = "ami-05d2d839d4f73aafb"
  instance_type_value = "t3.micro"
  subnet_id_value     = "subnet-0b24b650d076e6c10"
}

# produce outputs from the module
output "public_ip" {
  value = module.ec2_instance.public_ip
}

output "private_ip" {
  value = module.ec2_instance.private_ip
}
