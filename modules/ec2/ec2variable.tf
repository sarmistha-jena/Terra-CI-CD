variable "ami" {
  default = ""
}
variable "sg" {
  default = ""
}
variable "ip_association" {
  type    = bool
  default = false
}
variable "subnet" {
  default = ""
}
variable "instancetype" {
  default = "t2.micro"
}
variable "keyname" {
  default = "linux-pract1"
}
variable "userdata" {
  default = <<-EOF
  #!/bin/bash
  echo '<html><body><h1 style="font-size:50px;color:blue;">Sarmistha <br> <font style="color:red;"> www.myweb.com <br> <font style="color:green;"> Learn Devops </h1> </body></html>' > index.html
nohup busybox httpd -f -p 8080 &
EOF
}
variable "build_name" {
  default = ""
}