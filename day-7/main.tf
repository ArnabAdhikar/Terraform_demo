provider "aws" {
  region = "eu-north-1"
}

provider "vault" {
  address          = "http://13.48.45.171:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = "1b3b2722-1390-a6f8-fbee-5a34ccf8cdf4"
      secret_id = "e8cb0e1b-6d0b-93d4-53a3-6b844fc2092c"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"          // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-080254318c2d8932f"
  instance_type = "t3.micro"

  tags = {
    Name   = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
