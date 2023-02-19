#!/usr/bin/env deno run -A

import { useCommand } from "../utils/deno-utils.ts";

export const getWindows = async () => {
  const { stdout } = await useCommand(["tmux", "lsw"]);

  const windowlist: string[] = [];
  const windowNameMatcher =
    /(?<index>[0-9]{1}): (?<name>[\w/:%#\$&\?~\.=\+\-]+)(?<prefix>\*?Z?) \((?<panel>[0-9]{1}) panes\)/;
  stdout.split("\n").forEach((line) => {
    const groups = line.match(windowNameMatcher)?.groups;
    const name = groups?.name;
    if (name) {
      windowlist.push(name);
    }
  });
  return windowlist;
};

if (import.meta.main) {
  const windowlist = await getWindows();
  console.log(windowlist);
}
