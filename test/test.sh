#!/bin/bash
# Bomb if anything fails.
set -e

# Check each shell.
function check_shell
{
    local shell_command="$1"
    if which "$shell_command" >> /dev/null; then
        echo "test passed: '$shell_command' found";
    else
        echo "test failed: '$shell_command' not found";
        exit 1
    fi
}

shells=(sh csh tcsh bash ksh fish zsh ash dash heirloom-sh)

echo "Checking for shells..."
for shell in "${shells[@]}"; do
    check_shell "$shell"
done
