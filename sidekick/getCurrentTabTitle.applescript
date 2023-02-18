#!/usr/bin/osascript

tell application "Sidekick" to set currentTabTitle to title of active tab of window 1

return currentTabTitle
