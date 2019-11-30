#!/usr/bin/env bash

git filter-branch --commit-filter '
  if [ "$GIT_AUTHOR_NAME" = "Kokorinosoba" ];
  then
    GIT_COMMITTER_NAME="kokorinosoba>";
    GIT_AUTHOR_NAME="kokorinosoba";
    GIT_COMMITTER_EMAIL="34607448+kokorinosoba@users.noreply.github.com";
    GIT_AUTHOR_EMAIL="34607448+kokorinosoba@users.noreply.github.com";
    git commit-tree "$@";
  else
    git commit-tree "$@";
  fi' HEAD
