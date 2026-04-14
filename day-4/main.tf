provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "arnaba178" {
  ami           = "ami-05d2d839d4f73aafb"
  instance_type = "t3.micro"
  subnet_id     = "subnet-0b24b650d076e6c10"
}

resource "aws_s3_bucket" "arnab-terraform-demo-bucket" {
  bucket = "arnab-terraform-demo-713205"
}

# implement locking mechanism
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
