#!/usr/bin/env bash

readonly TMPDIR=${TMPDIR%/}

unzip -o "$(dirname $0)/../../../hammerspoon-shiftit/Spoons/ShiftIt.spoon.zip" -d "$TMPDIR/ShiftIt"
open "$TMPDIR/ShiftIt/ShiftIt.spoon"
