#!/usr/bin/swift

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title auto scroll
// @raycast.mode compact

// Optional parameters:
// @raycast.icon 🤖

// Documentation:
// @raycast.description auto scroll browser

import Foundation

func wheel(x: Int32, y: Int32) {
  CGEvent(
    scrollWheelEvent2Source: nil,
    units: CGScrollEventUnit.pixel,
    wheelCount: 1,
    wheel1: y,
    wheel2: x,
    wheel3: 0
  )?.post(tap: CGEventTapLocation.cghidEventTap)
}

while (true) {
  wheel(x: 0, y: -1)
  usleep(10_000)
}