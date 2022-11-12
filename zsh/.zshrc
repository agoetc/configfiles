# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
fpath=(~/.zsh/completion $fpath)
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
autoload -Uz compinit && compinit -i

# alias
alias dc='docker-compose'

# phpenv
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

# starship
eval "$(starship init zsh)"

# sheldon
eval "$(sheldon source)"

# ghq
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^g' ghq-fzf

# git
function c() {
 $(git branch --show-current)
}

# make
PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# java
. ~/.asdf/plugins/java/set-java-home.zsh

# chatworkのmobileに必要な設定
source ~/.zshrc-cw-mobile

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
