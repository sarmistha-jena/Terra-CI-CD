resource "aws_instance" "ec2" {
  ami                         = var.ami
  security_groups             = [var.sg]
  associate_public_ip_address = var.ip_association
  subnet_id                   = var.subnet
  instance_type               = var.instancetype
  key_name                    = var.keyname
  user_data                   = <<-EOF
  #!/bin/bash
  echo '<html><body><h1 style="font-size:50px;color:blue;">Sarmistha <br> <font style="color:red;"> www.myweb.com <br> <font style="color:green;"> Learn Devops </h1> </body></html>' > index.html
nohup busybox httpd -f -p 8080 &
EOF
  tags                        = {
    Name = "Server ${var.build_name}"
  }
}