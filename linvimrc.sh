#! /usr/bin/env zsh

alias l=\"ls -lh\"
alias ll=\"ls -lah\"
ulimit -c unlimited
export LANGUAGE='en_US.UTF-8'
export PATH=~/.vim/command:$PATH

if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    _prompt_color=(
      "%F{81}"  # Turquoise
      "%F{166}" # Orange
      "%F{135}" # Purple
      "%F{161}" # Hotpink
      "%F{118}" # Limegreen
    )
else
    _prompt_color=(
      "%F{cyan}"
      "%F{yellow}"
      "%F{magenta}"
      "%F{red}"
      "%F{green}"
    )
fi

PROMPT="${_prompt_color[3]}%n%f@${_prompt_color[2]}%m%f ${_prompt_color[1]}[%D{%Y-%m-%d %H:%M}]%f in ${_prompt_color[5]}%~%f
$ "
