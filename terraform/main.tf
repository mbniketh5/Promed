resource "aws_instance" "web" {
  ami           = "ami-0dd60a46ecc6eac16"
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}

