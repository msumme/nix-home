#!/bin/bash

set -euo pipefail

main() {
  check_preconditions
  install_nix_if_missing
  install_home_manager
  link_config
  enable_homemanager
}

check_preconditions() {
  if [[ ! -f "$HOME/hm-vars.nix" ]]; then
    echo
    >&2 echo "ERROR: You need to copy hm-vars.nix.example to $HOME/hm-vars.nix and set the appropriate values"
    exit 1
  fi
}

install_nix_if_missing() {
  if ! command -v nix-channel; then
      sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
      source "$HOME/.nix-profile/etc/profile.d/nix.sh"
  fi
}

install_home_manager() {
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update

  nix-shell '<home-manager>' -A install
}

link_config() {
  ln -sf "$PWD/home.nix" "$HOME/.config/nixpkgs/home.nix"
  ln -sf "$PWD/config.nix" "$HOME/.config/nixpkgs/config.nix"
}

enable_homemanager() {
  home-manager switch
}

main
