#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title add-daily-readinglist
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

tell application "Google Chrome" to set currentTabUrl to URL of active tab of window 1
tell application "Google Chrome" to set currentTabTitle to title of active tab of window 1

set link to "[" & currentTabTitle & "]" & "(" & currentTabUrl & ")"

set the clipboard to link

log link

set the fileName to do shell script "date '+%Y%m%d'"

do shell script "gsed -i \"/# Reading/a " & "- " & link & "\" ~/Develop/github.com/FukeKazki/ProgrammingNikki/articles/daily/" & fileName & ".mdx"