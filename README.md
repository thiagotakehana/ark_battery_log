# Battery Status Logger (Shell Script)

A simple **Shell script** to monitor battery status, log battery level, charging state, and system uptime.  
The output is printed to the terminal and saved to log files for later use.

## 📋 Features

- Gets current date and time
- Reads battery percentage
- Detects battery state:
  - 🔋 **Discharging**
  - ⚡ **Charging**
- Calculates system uptime (hours, minutes, and seconds)
- Saves:
  - Current battery status
  - Historical logs with timestamp, battery info, and uptime

## 📁 Generated Files

The script creates and updates the following files:

- **`/roms/tools/bat_status.txt`**
  - Contains only the current battery state:
    - `CHARGING`
    - `DISCHARGING`

- **`/roms/tools/bat_log.txt`**
  - Log history in the following format:
    ```
    DD/MM/YYYY HH:MM:SS - 🔋 Bat: 85% Status: Discharging Uptime:10h 32m 18s
    ```

## 🧠 Requirements

- Linux-based system
- Access to:
  - `/sys/class/power_supply/battery/capacity`
  - `/sys/class/power_supply/battery/status`
- Write permission to:
  - `/roms/tools/`

> ⚠️ **Note:** The path `/sys/class/power_supply/battery/` may vary depending on the device.  
> On some systems it may be named `BAT0`, `battery0`, etc.

## 🚀 Usage

1. Save the script as, for example:
   ```sh
   bat_logger.sh
