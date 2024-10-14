resource "aws_instance" "this" {
  ami           = lookup(var.ami_map, var.region)
  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id

  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name = var.instance_name
  }
}