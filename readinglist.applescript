#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title readinglist
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

tell application "Google Chrome" to set currentTabUrl to URL of active tab of window 1
tell application "Google Chrome" to set currentTabTitle to title of active tab of window 1

set link to "[" & currentTabTitle & "]" & "(" & currentTabUrl & ")"

set the clipboard to link

log link

set the filePath to "~/Develop/github.com/FukeKazki/ProgrammingNikki/articles/other/readinglist.mdx"

-- gsed -i '1i- [????](???)' readinglist.mdx
do shell script "gsed -i '1i- " & link & "'" & " " & filePath
