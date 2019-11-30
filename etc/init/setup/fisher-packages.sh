#!/usr/bin/env fish

# fisher packages install script
set -l packages "fisherman/pyenv"\
                "fisherman/rbenv"\
                "oh-my-fish/theme-bobthefish"

fisher add $packages
