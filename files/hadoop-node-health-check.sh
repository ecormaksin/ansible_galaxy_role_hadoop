#!/bin/bash

# Check disk usage
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -gt 90 ]; then
  echo "ERROR: Disk usage is above 90%."
  exit 1
fi

# Check memory usage
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if (($(echo "$MEMORY_USAGE > 90.0" | bc -l))); then
  echo "ERROR: Memory usage is above 90%."
  exit 1
fi

# If all checks pass
echo "Node is healthy."
exit 0
