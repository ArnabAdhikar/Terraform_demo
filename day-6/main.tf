provider "aws" {
  region = "ap-south-1"
}

variable "ami" {
  description = "The AMI goes here"
}

variable "instance_type" {
  description = "The instance type goes here"
  type        = map(string)

  default = {
    "dev"   = "t3.micro"
    "stage" = "t3.medium"
    "prod"  = "t3.xlarge"
  }
}

module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami           = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}
