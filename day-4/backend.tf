# backend configuration with S3.

terraform {
  backend "s3" {
    bucket = "arnab-terraform-demo-713205"
    key    = "arnab/terraform.tfstate"
    region = "ap-south-1"
    #use_lockfile = true
    # lock
    dynamodb_table = "terraform-locks"
  }
}
