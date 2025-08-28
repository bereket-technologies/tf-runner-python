terraform {
  required_version = ">= 0.13"
}

provider "null" {}

resource "null_resource" "hello_world" {
  triggers = {
    requirements_sha1 = filesha1("${path.module}/requirements.txt")
  }
  provisioner "local-exec" {
    command = <<EOT
      python3 -m pip install -r requirements.txt
    EOT
  }
}
