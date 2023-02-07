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

# log link
# 月表示を数字に置き換える
to monthNumStr(theMonth)
  set monList to {January, February, March, April, May, June, July, August, September, October, November, December}
  repeat with i from 1 to 12
    if item i of monList is theMonth then exit repeat
  end repeat
  return i
end monthNumStr

# 0埋めする
to pad(num)
  if num < 10 then
    return "0" & num
  else
    return num as text
  end if
end pad

set the yyyy to year of (current date)
set m to my monthNumStr(month of (current date))
set mm to my pad(m)
set the d to day of (current date)
set the dd to my pad(d)

set the filePath to "~/readinglist/" & yyyy & mm & dd & ".md"

log link

-- フォルダの作成

do shell script "zsh readinglist-internal/pull.sh"

do shell script "mkdir -p ~/readinglist"
-- ファイルの作成
do shell script "touch" & " " & filePath

-- ファイルの末尾に書き込む
-- echo '- [タイトル](URL)' >> filePath
do shell script "echo" & " " & "'- " & link & "'" & " " & ">>" & " " & filePath

do shell script "zsh readinglist-internal/push.sh"
