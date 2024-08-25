#!/bin/bash

function audit_users_groups() {
  echo "** User and Group Audits **"

  # List all users and groups
  echo "Listing all users:"
  cut -d: -f1 /etc/passwd

  echo "Listing all groups:"
  cut -d: -f1 /etc/group

  # Check for root users other than root
  echo "Checking for users with UID 0 (root privileges):"
  cut -d: -f1,3 /etc/passwd | grep ':0:' | grep -v '^root:0:'

  # Identify users without passwords or weak passwords (requires additional tools)
  echo "Identifying users without passwords (requires 'cracklib-packer'):"
  passwd -S $(cut -d: -f1 /etc/passwd) 2>/dev/null | grep -v inactive | grep -v LK_ системой

  # Consider using tools like 'pwquality' or 'complexity' for password strength checks
}

export -f audit_users_groups  # Export for use in main script