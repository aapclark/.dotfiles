#!/usr/bin/env zsh

XDG_SCREENSHOTS_DIR="${HOME}/Pictures/Screenshots"
mkdir -p "${XDG_SCREENSHOTS_DIR}"

function send_notification() {
    local exit_status=$1
    local mode=$2
    local filepath=$3

    if (( exit_status == 0 )); then
        notify-send -i camera-photo "Screenshot Captured" "Saved $mode screenshot to:\n${filepath}" -t 5000
    else
        notify-send -u critical "Screenshot Failed" "Failed to capture $mode screenshot" -t 5000
    fi
}

function capture_screenshot() {
    local mode=$1
    local timestamp=$(date '+%Y-%m-%d-%H:%M:%S')
    local filepath="${XDG_SCREENSHOTS_DIR}/${mode}-${timestamp}.png"

    # Capture screenshot based on the specified mode
    local output=$(/usr/bin/grimshot save "$mode" "$filepath" 2>&1)
    local exit_status=$?

    send_notification $exit_status "$mode" "$filepath"
}

function screenshot_selection() {
    typeset -a entries
    entries=(Active Screen Output Area Window)

    # Show menu and convert selection to lowercase
    local selected=$(print -l $entries | fuzzel -d --lines=${#entries[@]} | tr '[:upper:]' '[:lower:]')

    # Map the selected entry to capture_screenshot
    case $selected in
        active|screen|output|area|window)
            capture_screenshot "$selected"
            ;;
        *)
            echo "Invalid selection or cancelled."
            ;;
    esac
}

# Check arguments to determine which function to call
case "$1" in
    active)
        capture_screenshot "active"
        ;;
    selection)
        screenshot_selection
        ;;
    *)
        echo "Usage: $0 {active|selection}"
        exit 1
        ;;
esac

