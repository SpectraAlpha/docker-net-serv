#!/bin/bash
set -euo pipefail

# Determine squid runtime user (prefer 'proxy', fallback to 'squid', else 'root')
if getent passwd proxy >/dev/null 2>&1; then
  SQUID_USER=proxy
elif getent passwd squid >/dev/null 2>&1; then
  SQUID_USER=squid
else
  SQUID_USER=root
fi

# Ensure required directories exist and are owned correctly
mkdir -p /var/spool/squid /var/log/squid /var/run/squid
chown -R "$SQUID_USER":"$SQUID_USER" /var/spool/squid /var/log/squid /var/run/squid || true

# Initialize cache directories on first run
if [ ! -d /var/spool/squid/00 ]; then
  echo "Initializing Squid cache directories..."
  # Run in foreground mode during init to avoid daemonizing
  squid -N -z -f /etc/squid/squid.conf || true
  # Ensure ownership after initialization
  chown -R "$SQUID_USER":"$SQUID_USER" /var/spool/squid || true
fi

# Remove any stale PID file created during initialization
rm -f /var/run/squid.pid || true

# Run Squid in the foreground with debug level 1
exec squid -N -d 1 -f /etc/squid/squid.conf
