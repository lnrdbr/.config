echo -e "\033[38;5;89m    __                 __                     "
echo -e "\033[38;5;90m   / /__  ____        / /____  _________ ___  "
echo -e "\033[38;5;91m  / / _ \/ __ \______/ __/ _ \/ ___/ __  __ \\ "
echo -e "\033[38;5;92m / /  __/ /_/ /_____/ /_/  __/ /  / / / / / / "
echo -e "\033[38;5;93m/_/\___/\____/      \__/\___/_/  /_/ /_/ /_/  "
echo -e "\033[0m                                              "

autoload -U colors && colors

PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Vim mode
bindkey -v
export KEYTIMEOUT=10

vi-jk-escape() {
  if [[ $KEYS == 'jk' ]]; then
    zle vi-cmd-mode
  fi
}
zle -N vi-jk-escape
bindkey -M viins 'jk' vi-jk-escape

# Prefix history search with arrow keys
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

export EDITOR=nvim
export VISUAL=nvim
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
export PATH=$PATH:$HOME/.local/bin
export ZK_NOTEBOOK_DIR="$HOME/documents/notes"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/rgrc"
alias rcryptsync="rclone bisync ~/documents pcrypt:documents --filter-from ~/.config/rclone/filter.txt --resync --progress"a
alias opclaude="claude --dangerously-skip-permissions -w"
alias oc="claude --dangerously-skip-permissions"
alias kc="kubectl"
# $ mkvenv myvirtualenv # creates venv under ~/.virtualenvs/
# $ venv myvirtualenv   # activates venv
# $ deactivate          # deactivates venv
# $ rmvenv myvirtualenv # removes venv

export VENV_HOME="$HOME/.virtualenvs"
[[ -d $VENV_HOME ]] || mkdir $VENV_HOME

lsvenv() {
  ls -1 $VENV_HOME
}

venv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      source "$VENV_HOME/$1/bin/activate"
  fi
}

mkvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      python3 -m venv $VENV_HOME/$1
  fi
}

rmvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      rm -r $VENV_HOME/$1
  fi
}

cw() {
  local issue="$1"
  local dir="../worktrees/worktree-$issue"
  git worktree add "$dir" -b "feat/$issue"
  cp .env "$dir"
  cd "$dir" && claude
}

# zathura() {
#     if [[ -n "$TMUX" ]]; then
#         nohup /opt/homebrew/bin/zathura "$@" >/dev/null 2>&1 &
#         disown
#     else
#         /opt/homebrew/bin/zathura "$@"
#     fi
# }
export PATH="$HOME/.local/bin:$PATH"


export PATH="/Users/leonard/.bun/bin:$PATH"
eval "$(fnm env)"
