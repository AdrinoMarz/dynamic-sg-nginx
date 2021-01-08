output "public_ip" {
  value       = aws_instance.amazon_ami.*.public_ip
  description = "The public IP of the web server"
}