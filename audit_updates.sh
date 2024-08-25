#!/bin/bash

function audit_updates() {
  echo "** Security Updates and Patching **"

  # Check for available updates (requires package manager)
  echo "Checking for available updates (requires 'apt' or 'yum'):"
  if [[ -x /usr/bin/apt ]]; then
    sudo apt update && sudo apt upgrade -y 2>&1
  elif [[ -x /usr/bin/yum ]]; then
    sudo yum update -y 2>&1
  else
    echo "ERROR: Unsupported package manager. Please install 'apt' or 'yum'."
  fi
}

export -f audit_updates