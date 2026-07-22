#!/bin/bash
set -e

# 1. Start SSH service as root
/usr/sbin/sshd

# 2. Switch to 'mssql' user to run SQL Server
exec gosu mssql /opt/mssql/bin/sqlservr