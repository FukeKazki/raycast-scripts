#!/usr/bin/env deno run -A

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title youtube-music-title
// @raycast.mode compact

import { useCommand } from "./utils/deno-utils.ts";

// どこから実行されても相対パスを良い感じにする方法
const path = new URL("./youtube-music/getTitle.applescript", import.meta.url);
const { stdout } = await useCommand([
  path,
]);
const titleMatcher = /YouTube Music \- (?<title>.+) \- YouTube Music/;
const { title } = stdout.match(titleMatcher)?.groups;
console.log(title);
