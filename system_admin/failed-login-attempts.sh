#!/bin/bash
# Shows IPs with most failed SSH login attempts on macOS

echo "===== Failed SSH Login Attempts (Last 24 Hours) ====="

log show --predicate 'eventMessage CONTAINS "Failed password"' --style syslog --last 1d 2>/dev/null | \
grep "sshd" | awk '{print $(NF)}' | sort | uniq -c | sort -nr

