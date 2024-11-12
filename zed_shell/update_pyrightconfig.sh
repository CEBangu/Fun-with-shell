#!/bin/zsh

# Check if an argument was provided
if [ -z "$1" ]; then
  echo "You must provide a new virtual environment name."
  exit 1
fi

# Set the new virtual environment name
NEW_VENV=$1

# Check if pyrightconfig.json exists in the current directory
if [ ! -f pyrightconfig.json ]; then
  echo "pyrightconfig.json not found in the current directory."
  exit 1
fi

# Use jq to update the JSON file with the new venv value
# jq is a command-line tool for processing JSON
jq --arg newVenv "$NEW_VENV" '.venv = $newVenv' pyrightconfig.json > tmp.json && mv tmp.json pyrightconfig.json

# Output success message
echo "venv in pyrightconfig.json updated to $NEW_VENV."
