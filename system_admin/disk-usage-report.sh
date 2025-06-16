#!/bin/bash
# Shows disk usage info (macOS)

echo "===== Disk Usage Report ====="
printf "%-30s %-10s %-10s %-10s %-10s\n" "Mount Point" "Size" "Used" "Available" "Use%"

# Skip irrelevant filesystems like devfs, map, etc.
df -h | grep -Ev '^map|^devfs|^procfs' | awk 'NR>1 {
  printf "%-30s %-10s %-10s %-10s %-10s\n", $9, $1, $2, $3, $5
}'

