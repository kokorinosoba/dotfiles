#!/usr/bin/env bash

packages=(
  todo
  typescript
  run
  vue-cli
  gitmoji-cli
)

npm install -g ${packages[@]}
