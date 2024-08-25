#!/bin/bash

function audit_services() {
  echo "** Service Audits **"

  # List running services
  echo "Listing all running services:"
  systemctl list-units --type service | awk '{print $1}'

  # Check for unnecessary services (requires knowledge of specific systems)
  echo "Identifying potentially unnecessary services (manual review needed):"
  # Example: systemctl status postfix  # Check if postfix is needed

  # Ensure critical services are running
  echo "Checking critical services:"
  for service in sshd iptables; do
    systemctl status $service | grep "active (running)" >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
      echo "WARNING: Service '$service' is not running!"
    fi
  done

  # Check for non-standard ports
  echo "Checking for services listening on non-standard ports:"
  netstat -antlp | grep LISTEN | awk '{print $4}' | cut -d: -f2 | sort -u | grep -vE '^(22|80|443)$'
}

export -f audit_services