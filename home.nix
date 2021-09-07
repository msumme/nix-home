{ config, pkgs, ... }:
let
  shellspec = pkgs.callPackage ./nix/shellspec.nix { pkgs = pkgs; };
  myPackages = (with pkgs; [ 
    nixfmt 
    direnv 
    diff-so-fancy 
    gh 
    shellspec
    docker
    nodejs
    yarn
    zip
    unzip
    jq
    wget
    watchman
    bundler
  ]);
# can't current install rubymine, iterm2, xcode from here
  homeDirectory = /Users/msumme;
  varFile = homeDirectory + "/hm-vars.nix";
  vars = import varFile;
in {
  programs.home-manager.enable = true;
  home.username = "msumme";
  home.homeDirectory = homeDirectory;
  home.stateVersion = "21.05";

  home.packages = [ ] ++ myPackages;
  home.file = {
    ".githelpers".source = ./files/githelpers.sh;
    ".zshrc".text = ''
      for x in `ls $HOME/.shell.d/*.{z,}sh`; do
        source "$x"
      done
    '';
    ".bashrc".text = ''
      for x in `ls $HOME/.shell.d/*.{ba,}sh`; do
         source "$x"
      done
    '';
    ".shell.d" = {
      source = ./files/shell.d;
      recursive = true;
    };
    ".shell.d/bin" = {
      source = ./files/bin;
      recursive = true;
    };
  };
  programs = {
    vim = {
      enable = true;
      plugins = [pkgs.vimPlugins.vim-nix];
      settings = {
        mouse = "a";
      };
      extraConfig = ''
        set nocompatible
        syntax enable
        set number
        set softtabstop=2 expandtab
        set incsearch
        set shiftwidth=4
        map <F2> :set number!<CR>
        imap <F2> <C-o>:set number!<CR>
        '';
    };

    git = import ./git.nix {inherit (vars) git_name git_email;};
  };
}
