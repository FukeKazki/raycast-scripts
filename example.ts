#!/usr/bin/env deno run -A

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title example
// @raycast.mode fullOutput

// Optional parameters:
// @raycast.icon 🤖

import { useCommand } from "./utils/deno-utils.ts";

const getCurentTabUrl = async () => {
  const {status, stdout, stderror} = await useCommand(["./edge/getCurrentTabUrl.applescript"])
  if (!status.success) throw new Error(stderror)
  return stdout
}

const getCurrentTabTitle = async () => {
  const {status, stdout, stderror} = await useCommand(["./edge/getCurrentTabTitle.applescript"])
  if (!status.success) throw new Error(stderror)
  return stdout
}

const url = await getCurentTabUrl()
const title = await getCurrentTabTitle()

console.log(url)
console.log(title)
