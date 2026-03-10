# Bastion Public IP
output "bastion_public_ip" {
  description = "Public IP of Bastion server"
  value       = aws_instance.bastion.public_ip
}

# App Server Private IP
output "app_private_ip" {
  description = "Private IP of App server"
  value       = aws_instance.app.private_ip
}

# PostgreSQL RDS Endpoint
output "db_endpoint" {
  description = "PostgreSQL RDS endpoint"
  value       = aws_db_instance.postgres.endpoint
}

# # Generate Ansible inventory automatically
# output "inventory" {
#   description = "Dynamic Ansible inventory"
#   value = <<EOT
# [bastion]
# ${aws_instance.bastion.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/ec2.pem

# [app]
# ${aws_instance.app.private_ip} ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/ec2.pem ansible_ssh_common_args='-o ProxyJump=ec2-user@${aws_instance.bastion.public_ip}'
# EOT
# }

# output "inventory" {
#   value = <<EOT
# [bastion]
# ${aws_instance.bastion.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa

# [app]
# ${aws_instance.app.private_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_ssh_common_args='-o ProxyJump=ubuntu@${aws_instance.bastion.public_ip}'
# EOT
# }
# output "db_node_ip" {
#   value = aws_db_instance.postgres.address
# }
