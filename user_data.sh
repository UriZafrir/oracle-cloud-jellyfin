#!/bin/bash

# Update system and install prerequisites
dnf update -y
dnf install -y curl

# Disable firewalld (since we're using NSGs for security)
systemctl disable --now firewalld

# Disable SELinux
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

# Install k3s
curl -sfL https://get.k3s.io | sh -s - \
  --write-kubeconfig-mode 644 \
  --tls-san $(curl -s http://169.254.169.254/opc/v1/instance/publicIp) \
  --node-ip $(curl -s http://169.254.169.254/opc/v1/instance/privateIp)

# Wait for k3s to be ready
until kubectl get node; do
  sleep 5
done

# Get the kubeconfig for remote access
mkdir -p /home/opc/.kube
cp /etc/rancher/k3s/k3s.yaml /home/opc/.kube/config
chown -R opc:opc /home/opc/.kube
sed -i "s/127.0.0.1/$(curl -s http://169.254.169.254/opc/v1/instance/publicIp)/" /home/opc/.kube/config 