resource "aws_instance" "amazon_ami" {
    ami                       = "ami-04b1ddd35fd71475a"
    instance_type             = "t2.micro"
    #vpc_security_group_ids   = "sg-0dfa7c5448acf35de"
    key_name                  = "mypemfile"
    vpc_security_group_ids    = ["${aws_security_group.dynamic_sg.id}"]
    
    provisioner "remote-exec" {
        inline = [
            "sudo amazon-linux-extras install -y nginx1",
            "sudo systemctl start nginx"
        ]

    connection {
        host        = self.public_ip
        type        = "ssh"
        user        = "ec2-user"
        private_key = file("./mypemfile.pem")
     }
    }

    tags = {
        Name  = "Nginx-webserver"
        Owner = "Adrino"
        Env   = "dev"
    }

}    