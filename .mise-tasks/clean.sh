#!/usr/bin/env bash
#MISE description="Delete the .go-dev-tools directory"
#MISE quiet=true

# Attempting to delete this without sudo will lead to permission errors
sudo rm -rf .go-dev-tools
