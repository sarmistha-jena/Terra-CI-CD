variable "build_name" {
  type    = string
  default = "CI-CD practice"
}
variable "server_port" {
  default = "8080"
}
variable "elb_port" {
  default = "80"
}
variable "type" {
  default = "t3.micro"
}