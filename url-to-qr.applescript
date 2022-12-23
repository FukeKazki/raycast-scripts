#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title url2qr
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ??

tell application "Google Chrome" to set currentTabUrl to URL of active tab of window 1

set qrLink to replaceText("https://jig.jp/qrcode/?param=" & currentTabUrl, "&", "%26")

-- https://apple.stackexchange.com/questions/271702/applescript-how-to-open-a-link-in-google-chrome-in-a-new-adjacent-tab
tell application "Google Chrome"
    activate
    tell front window to make new tab at after (get active tab) with properties {URL:qrLink} -- open a new tab after the current tab
end tell

-- http://tonbi.jp/AppleScript/Tips/String/FindReplace.html
on replaceText(theText, serchStr, replaceStr)
	set tmp to AppleScript's text item delimiters
	set AppleScript's text item delimiters to serchStr
	set theList to every text item of theText
	set AppleScript's text item delimiters to replaceStr
	set theText to theList as string
	set AppleScript's text item delimiters to tmp
	return theText
end replaceText