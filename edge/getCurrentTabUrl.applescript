#!/usr/bin/osascript

tell application "Microsoft Edge" to set currentTabUrl to URL of active tab of window 1

return currentTabUrl
