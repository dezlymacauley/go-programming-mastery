#!/usr/bin/env bash
#MISE description="Install Go and Go dev tools"
#MISE quiet=true

# Delete any existing `.go-dev-tools` directory
# Attempting to delete this without sudo will lead to permission errors
sudo rm -rf .go-dev-tools

# Create a new one
mkdir .go-dev-tools

# Install project dependencies
go install $(go list tool)
