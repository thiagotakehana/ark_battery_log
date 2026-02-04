#!/bin/sh

DATENOW=$(date '+%d/%m/%Y %H:%M:%S')
# Read battery capacity and status
BAT_PERCENT=$(cat /sys/class/power_supply/battery/capacity)
BAT_STATUS=$(cat /sys/class/power_supply/battery/status)

if [ "$BAT_STATUS" = "Charging" ]; then
    BAT_ICON="⚡"
    echo "CHARGING" > /roms/tools/bat_status.txt
else
    BAT_ICON="🔋"
    echo "DISCHARGING" > /roms/tools/bat_status.txt
fi

# Uptime
UPTIME_SECONDS=$(cut -d. -f1 /proc/uptime)

HOURS=$((UPTIME_SECONDS / 3600))
MINUTES=$(((UPTIME_SECONDS % 3600) / 60))
SECONDS=$((UPTIME_SECONDS % 60))

MSG="${DATENOW} - ${BAT_ICON} Bat: ${BAT_PERCENT}% Status: ${BAT_STATUS} Uptime:${HOURS}h ${MINUTES}m ${SECONDS}s"
echo $MSG
echo $MSG >> /roms/tools/bat_log.txt
