#!/bin/bash
# user-report.sh - Lists all users, their shell, and last login (macOS)

echo "##########################################################################"
echo "===== User Report ====="
printf "%-15s | %-20s | %-30s\n" "User" "Shell" "Last Login"

echo "###########################################################################"

cut -d: -f1,7 /etc/passwd | while IFS=: read -r user shell; do
  # Skip system users (optional)
  [[ "$shell" == "/usr/bin/false" || "$shell" == "/usr/sbin/nologin" ]] && continue

  last_login=$(last "$user" | head -1 | awk '{print $4, $5, $6, $7}')
  printf "%-15s | %-20s | %-30s\n" "$user" "$shell" "$last_login"
done

