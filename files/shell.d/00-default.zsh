HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Key bindings
bindkey -e

bindkey '^[[1;5D' backward-word
bindkey '^[[5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char


# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete #_match _prefix
zstyle ':completion:*' format 'Completing %D %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[-._\ ]=** r:|=**' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[-._\ ]=** r:|=**' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[-._\ ]=** r:|=**' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[-._\ ]=** r:|=**'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original false
zstyle ':completion:*' prompt '%e errors:'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false

autoload -Uz compinit
compinit
# End of lines added by compinstall

export MANPATH=$HOME/.nix-profile/share/man:/usr/local/share/man:$MANPATH
export INFOPATH=$HOME/.nix-profile/share/info:/usr/local/share/info:$INFOPATH



autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git cvs svn

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

setopt promptsubst
PS1=$'%m:%~ `vcs_info_wrapper` \n%# '

setopt histverify
setopt autocd
