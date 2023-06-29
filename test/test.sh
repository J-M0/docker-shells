#!/bin/sh
# Bomb if anything fails.
set -e

# Check each shell.
shells='sh csh tcsh bash ksh fish zsh ash dash heirloom-sh'

echo "Checking for shells..."
for shell in $shells; do
    if command -v "$shell" >> /dev/null; then
        printf "\033[1;32mtest passed: '%s' found\n\033[0;0m" "$shell"
    else
        printf "\033[1;31mtest failed: '%s' not found\n\033[0;0m" "$shell"
        exit 1
    fi
done
