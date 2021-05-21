#!/bin/bash

# install nix
if ! command -v nix-channel; then
    sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update


nix-shell '<home-manager>' -A install
