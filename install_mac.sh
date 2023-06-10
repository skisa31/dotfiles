#!/bin/bash -e

IGNORE_PATTERN="^\.(git|travis)"

echo "Create dotfile links."
for dotfile in .??*; do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done
echo "Success"

echo "Start installing packages in Brewfile"
brew bundle 
echo "Done"
