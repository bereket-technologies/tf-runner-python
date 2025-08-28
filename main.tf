terraform {
  required_version = ">= 0.13"
}

provider "null" {}

resource "null_resource" "hello_world" {
  provisioner "local-exec" {
    command = <<EOT
      python3 -m pip install -r requirements.txt
    EOT
  }
}
