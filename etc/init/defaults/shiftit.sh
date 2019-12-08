#!/usr/bin/env bash

defaults write org.shiftitapp.ShiftIt leftModifiers -int 9961472
defaults write org.shiftitapp.ShiftIt rightModifiers -int 9961472
defaults write org.shiftitapp.ShiftIt topModifiers -int 9961472
defaults write org.shiftitapp.ShiftIt bottomModifiers -int 9961472

defaults write org.shiftitapp.ShiftIt tlModifiers -int 1572864
defaults write org.shiftitapp.ShiftIt trModifiers -int 1572864
defaults write org.shiftitapp.ShiftIt blModifiers -int 1572864
defaults write org.shiftitapp.ShiftIt brModifiers -int 1572864

defaults write org.shiftitapp.ShiftIt centerModifiers -int 1572864
defaults write org.shiftitapp.ShiftIt zoomModifiers -int 1572864
defaults write org.shiftitapp.ShiftIt maximizeModifiers -int 1572864
defaults write org.shiftitapp.ShiftIt fullScreenModifiers -int 1572864

defaults write org.shiftitapp.ShiftIt increaseKeyCode -int 41
defaults write org.shiftitapp.ShiftIt increaseModifiers -int 1703936
defaults write org.shiftitapp.ShiftIt reduceModifiers -int 1572864

defaults write org.shiftitapp.ShiftIt nextscreenModifiers -int 1572864
defaults write org.shiftitapp.ShiftIt previousscreenModifiers -int 1572864


killall ShiftIt
open /Applications/ShiftIt.app
