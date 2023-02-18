#!/usr/bin/env deno run -A

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title hyper-readinglist
// @raycast.mode compact

// Optional parameters:
// @raycast.icon 🤖
// @raycast.argument1 { "type": "text", "placeholder": "メモ", "optional": true }

import { useCommand } from "./utils/deno-utils.ts";
import { resolve } from "https://deno.land/std@0.130.0/path/mod.ts";
import { format } from "https://deno.land/std@0.130.0/datetime/mod.ts";

const getCurentTabUrl = async () => {
  const { status, stdout, stderror } = await useCommand([
    "./sidekick/getCurrentTabUrl.applescript",
  ]);
  if (!status.success) throw new Error(stderror);
  return stdout;
};

const getCurrentTabTitle = async () => {
  const { status, stdout, stderror } = await useCommand([
    "./sidekick/getCurrentTabTitle.applescript",
  ]);
  if (!status.success) throw new Error(stderror);
  return stdout;
};

await useCommand(["zsh", "./readinglist-internal/pull.sh"]);

const url = (await getCurentTabUrl()).replace(/\r?\n/g, "");
const title = (await getCurrentTabTitle()).replace(/\r?\n/g, "");
// argments1を取得
const memo = Deno.args[0] ?? "";

const obj = {
  date: new Date(),
  title,
  url,
  memo,
};

const date = format(new Date(), "yyyyMMdd");

const path = resolve(`${Deno.env.get("HOME")}/readinglist/${date}.json`);
console.log(path);
const row = await Deno.readTextFile(path).catch(() => "[]");
const json = JSON.parse(row);
json.push(obj);
await Deno.writeTextFile(
  path,
  JSON.stringify(json),
  {
    create: true,
  },
);

await useCommand(["zsh", "./readinglist-internal/push.sh"]);
