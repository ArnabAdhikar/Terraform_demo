# create EC2 instance using terraform

# Checks if the terraform is able to connect to AWS
provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "example" {
    ami = "ami-05d2d839d4f73aafb"
    instance_type = "t3.micro"
}
