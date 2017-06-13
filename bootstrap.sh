#!/bin/sh

cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "*.un~" \
    --exclude "README.md" --exclude "LICENSE-MIT.txt" -av --no-perms . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
  reset
elif [ "$1" == "--provision" -o "$1" == "-p" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
    reset
    chmod 644 $HOME/.ssh/config*
  fi
fi
unset doIt
