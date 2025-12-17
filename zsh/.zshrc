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

export PATH=$PATH:$HOME/.local/share/bob/nvim-bin



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
