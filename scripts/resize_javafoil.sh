#!/bin/bash
sleep 3

# Shutting down warning window.
wmctrl -F -c "JavaFoil - Warning"

while [[ "$WID" == "" ]]; do
        # Sleep for 15 milliseconds to prevent busy loop.
        sleep 0.015
        
        # Check if the process is still running, otherwise exit.
        if ! pgrep "java"; then
            exit 1
        fi
        
        # Query the window ID from the process ID.
        WID="$(wmctrl -lp | grep "JavaFoil" | cut -d" " -f1)"
done

# Resizing main window
wmctrl -ir "${WID}" -b add,maximized_vert,maximized_horz