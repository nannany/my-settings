export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/pkg

export GOKU_EDN_CONFIG_FILE=$HOME/ghq/github.com/nannany/my-settings/karabiner.edn

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000

# share .zshhistory
setopt inc_append_history
setopt share_history

# ctrl + r
function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# ctrl + g
function peco-ghq-selection() {
    BUFFER="cd `ghq list -p | peco`"
    zle accept-line
    zle reset-prompt
}

zle -N peco-ghq-selection
bindkey '^G' peco-ghq-selection

# ctrl + b
function peco-hub-selection() {
    BUFFER="gh repo view `ghq list | peco | cut -d "/" -f 2,3` --web"
    zle accept-line
    zle reset-prompt
}

zle -N peco-hub-selection
bindkey '^B' peco-hub-selection
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"


source $HOME/ghq/github.com/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/ghq/github.com/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


source $HOME/ghq/github.com/git/git/contrib/completion/git-prompt.sh
# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)") $AWS_PROFILE]\$ '
