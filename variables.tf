variable "sg_ports" {
    type        = list(number)
    description = "These ports the EC2 will use for HTTP/HTTPS requests"
    default     = [80, 8080, 8081, 443]
}

variable "ssh_port" {
  description = "The port the server will use for SSH requests"
  type        = number
  default     = 22
}

variable "ingressCIDRblock" {
    description = "The IP the server will use for SSH requests"
    type = list
    default = ["0.0.0.0/0"]
}