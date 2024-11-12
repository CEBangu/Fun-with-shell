#!/bin/zsh

# Check if an argument was provided
if [ -z "$1" ]; then
  echo "You must provide a virtual environment name."
  exit 1
fi

# Set the virtual environment name
VENV_NAME=$1

# Create the JSON content , replace venvPath with the path to your virtual environments
JSON_CONTENT=$(cat <<EOF
{ 
  "venvPath": "/opt/homebrew/Caskroom/miniconda/base/envs", 
  "venv": "$VENV_NAME"
}
EOF
)

# Write to pyrightconfig.json in the current directory
echo "$JSON_CONTENT" > pyrightconfig.json

# Output success message
echo "pyrightconfig.json created with venv set to $VENV_NAME."
