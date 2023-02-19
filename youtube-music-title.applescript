#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title youtube-music-title
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ??

tell application "Sidekick"
	set allTabs to tabs of windows
	repeat with currentTab in allTabs
		repeat with t in currentTab
			set AHIAHI to URL of t
			if AHIAHI starts with "https://music.youtube.com/" then
				set titleText to execute t javascript "document.querySelector('ytmusic-player-bar .title').textContent;"
				return titleText
			end if
		end repeat
	end repeat
end tell

