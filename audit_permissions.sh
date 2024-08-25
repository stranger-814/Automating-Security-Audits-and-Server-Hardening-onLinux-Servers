#!/bin/bash

function audit_permissions() {
  echo "** File and Directory Permissions **"

  # Scan for world-writable files and directories
  echo "Checking for world-writable files and directories:"
  find / -xdev -perm -wo -type d,f 2>/dev/null

  # Check .ssh directory permissions
  echo "Checking .ssh directory permissions:"
  if [[ -d /home/$USER/.ssh ]]; then
    file /home/$USER/.ssh /home/$USER/.ssh/* 2>/dev/null
  fi

  # Report SUID/SGID bits on executables
  echo "Reporting files with SUID/SGID bits set on executables:"
  find / -xdev -perm -g+s, -perm -u+s -type f -executable 2>/dev/null
}

export -f audit_permissions