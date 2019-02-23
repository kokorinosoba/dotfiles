#!/bin/bash

set -eux

has() {
  type "$1" > /dev/null 2>&1
}

has brew && echo brew
