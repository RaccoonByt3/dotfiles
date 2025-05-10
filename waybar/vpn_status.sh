#!/usr/bin/env bash

# Check if tun0 exists and is up
if ip link show proton0 &>/dev/null; then
    # VPN active
    echo -n "{\"text\":\"󰳈 \",\"class\":\"active\"}"
else
    # VPN inactive
    echo -n "{\"text\":\"󰦜 \",\"class\":\"inactive\"}"
fi

