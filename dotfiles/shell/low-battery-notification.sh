#!/usr/bin/env bash

# Get battery level (works on most laptops)
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

# Thresholds
LOW=20
CRITICAL=10

if [ "$battery_status" = "Discharging" ]; then
    if [ "$battery_level" -le "$CRITICAL" ]; then
        # -u critical ensures it stays on screen (timeout 0 in your config)
        notify-send -u critical "🪫 CRITICAL BATTERY" "Battery at ${battery_level}%. Plug in now\!"
    elif [ "$battery_level" -le "$LOW" ]; then
        # -u normal uses your 8s timeout
        notify-send -u normal "🔋 Low Battery" "Battery is at ${battery_level}%."
    fi
fi