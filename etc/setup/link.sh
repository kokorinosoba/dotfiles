#!/bin/bash

set -eu

cd `dirname $0`
cd ../scripts
SCRIPT_DIR=$(pwd)

echo "Continue creating symlink? [Y/n]"
read ANSWER

case $ANSWER in
  "" | "Y" | "y" | "yes" | "Yes" | "YES" ) ;;
  * ) echo "Canceled."
      exit 1 ;;
esac

bash symlink.sh
