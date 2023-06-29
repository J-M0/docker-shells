#!/bin/bash
# Bomb if anything fails.
set -e

# Check each shell.
shells=(sh csh tcsh bash ksh fish zsh ash dash heirloom-sh)

echo "Checking for shells..."
for shell in "${shells[@]}"; do
    if which "$shell" >> /dev/null; then
        echo "test passed: '$shell' found";
    else
        echo "test failed: '$shell' not found";
        exit 1
    fi
done
