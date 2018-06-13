#!/bin/bash

# WSL-specific setup
if grep -q Microsoft /proc/sys/kernel/osrelease; then
    #echo "Detected WSL!"

    # Set up for Xming
    export DISPLAY=:0
fi
