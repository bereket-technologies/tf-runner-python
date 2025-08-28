terraform {
  required_version = ">= 0.13"
}

provider "null" {}

resource "null_resource" "hello_world" {
  provisioner "local-exec" {
    command = <<EOT
      python3 -c "print('Hello, World from Python via Terraform!')"
    EOT
  }
}
