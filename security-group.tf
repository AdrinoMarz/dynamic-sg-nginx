resource "aws_security_group" "dynamic_sg" {
    name = "dynamic-sg"
    description = "Allow incoming/Outgoing HTTP connections & SSH access"
    # Ingress rules are set as dynamic, so need to specify one time only.
    dynamic "ingress" {
        for_each = var.sg_ports
        iterator = port
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    # Inbound SSH from anywhere
    ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.ingressCIDRblock
    }
  
    # Allow all outbound
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "Dynamic-Security-Group"
    }

}