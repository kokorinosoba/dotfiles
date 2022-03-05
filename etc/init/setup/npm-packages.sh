#!/usr/bin/env bash

packages=(
  todo
  run
  vue-cli
  gitmoji-cli
)

npm install -g ${packages[@]}
