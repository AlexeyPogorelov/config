#!/bin/bash

# This script toggles the CPU scaling governor between 'performance' and 'powersave'.
# It must be run with sudo privileges or it will prompt for the sudo password.

# Check the current governor state of the first CPU core (cpu0)
# We assume all cores are in the same state.
CURRENT_GOVERNOR=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

# Use an if-else statement to toggle the state
if [ "$CURRENT_GOVERNOR" = "performance" ]; then
  # If it's in performance mode, switch to powersave
  echo "Switching to powersave mode."
  echo -n "powersave" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
  powerprofilesctl set power-saver
else
  # Otherwise, switch to performance mode
  echo "Switching to performance mode."
  echo -n "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
  powerprofilesctl set performance
fi

# Confirm the new state by reading it again
NEW_GOVERNOR=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
echo "Current CPU mode is now: $NEW_GOVERNOR"

