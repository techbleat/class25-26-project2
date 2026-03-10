#!/bin/bash
echo "[bastion]"
echo "$(terraform output -raw bastion_node_ip) ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/ec2.pem"

echo "[app_servers]"
echo "$(terraform output -raw app_node_ip) ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/ec2.pem ansible_ssh_common_args='-o ProxyJump=ec2-user@$(terraform output -raw bastion_node_ip)'"