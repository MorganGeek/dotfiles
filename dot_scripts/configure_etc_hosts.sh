#!/usr/bin/env bash
# Customize /etc/hosts
echo "Overriding /etc/hosts"
curl https://someonewhocares.org/hosts/hosts -o /etc/hosts
