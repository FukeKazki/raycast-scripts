#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title url2qr
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ??

tell application "Google Chrome" to set currentTabUrl to URL of active tab of window 1

set qrLink to "https://jig.jp/qrcode/?param=" & currentTabUrl

-- https://apple.stackexchange.com/questions/271702/applescript-how-to-open-a-link-in-google-chrome-in-a-new-adjacent-tab
tell application "Google Chrome"
    activate
    tell front window to make new tab at after (get active tab) with properties {URL:qrLink} -- open a new tab after the current tab
end tell