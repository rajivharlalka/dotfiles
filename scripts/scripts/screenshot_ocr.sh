#!/bin/bash

# Take a screenshot with Flameshot and copy it to clipboard
flameshot gui --clipboard

# Temporary file to store screenshot
# temp_image=$(mktemp /tmp/flameshot_screenshot_XXXX.png)

# Save the screenshot from clipboard to a file
# xclip -selection clipboard -t image/png -o >"$temp_image"

# Run OCR with Frog and copy the result to clipboard
ocr_result=$(ocrdesktop -C -c) # Adjust the input flag based on Frog's syntax
# echo "$ocr_result" | xclip -selection clipboard

sleep 1
pkill ocrdesktop
# Clean up temporary file
# rm "$temp_image"
