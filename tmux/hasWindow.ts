#!/usr/bin/env deno run -A

import { getWindows } from "./getWindows.ts";

const window = Deno.args[0];

const windowlist = await getWindows();

console.log(windowlist.some((v) => v === window));
