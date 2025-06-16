#!/bin/bash
# Lists top 5 CPU and memory-consuming processes (macOS)

echo "===== Top 5 CPU-Consuming Processes ====="
ps aux | sort -nrk 3 | head -n 5

echo "#################################################"
echo "===== Top 5 Memory-Consuming Processes ====="
ps aux | sort -nrk 4 | head -n 5

