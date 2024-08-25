#!/bin/bash

# Include all functions
source audit_users_groups.sh
source audit_permissions.sh
source audit_services.sh
source audit_firewall_network.sh
source audit_ip_network.sh
source audit_updates.sh
source audit_logs.sh
source harden_server.sh
source custom_checks.sh
source report_alert.sh

# Run all functions
audit_users_groups
audit_permissions
audit_services
audit_firewall_network
audit_ip_network
audit_updates
audit_logs
harden_server
custom_checks
report_alert