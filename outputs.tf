output "vm_ip" {
  description = "Debian VM IP"
  value       = aws_instance.vm_aws.public_ip
}