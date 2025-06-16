#!/bin/bash

# Checks status of critical services

echo "##########################################################################"
SERVICES=("ssh" "nginx" "docker" "mysql")
echo "===== Service Status ====="
for service in "${SERVICES[@]}"; do
  systemctl is-active --quiet $service && status="Active" || status="Inactive"
  echo "$service: $status"
done
