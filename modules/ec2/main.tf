resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ec2-user

              curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
              yum install -y nodejs

              npm install -g pm2
              EOF

  tags = merge({
    Name = "app-instance"
  }, var.tags)
}
