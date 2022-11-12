# 環境
source ~/.asdf/asdf.fish
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x JAVA_HOME (/usr/libexec/java_home)
set -x PATH ~/bin/flutter/bin $PATH
set -x PATH ~/work/vagrant-chatwork/src/ec_projects/chatwork/chatwork_tools/bin:$PATH
set -g fish_user_paths "/usr/local/opt/ansible@2.8/bin" $fish_user_paths
set -gx PATH $PATH $HOME/.krew/bin
# fzf
set -U FZF_LEGACY_KEYBINDINGS 0
# hub
eval (hub alias -s)


# alias
alias gs='git status'
alias dc='docker-compose'
alias cat='ccat'
alias kc='kubectl'
alias witch='which' # 甘え

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/takegawa/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/takegawa/Downloads/google-cloud-sdk/path.fish.inc'; end
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths


function fish_user_key_bindings
      fzf_key_bindings
    end

# merge済みbranch消すやつ
function branch_clean
      git branch --merged|egrep -v '\*|develop|master'|xargs git branch -d
end


function enable_touchid_auth
      curl -sL https://gist.github.com/kawaz/d95fb3b547351e01f0f3f99783180b9f/raw/install-pam_tid-and-pam_reattach.sh | bash
end
