# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#--------------------------
#- Other aliases
#--------------------------
alias cq='cai queue'
alias cj='cai job'
alias sa='source activate'
alias sad='source activate video-ladder-desktop'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# added by Anaconda3 4.2.0 installer
export PATH="/home/vik/anaconda3/bin:$PATH"

#--------------------
#- Custom Directories
#--------------------
export WRK="/home/vik/vikkamath/vik-daily"

#--------------------------
#- CUDA (8.0) & CUDNN (5.1)
#--------------------------
export PATH="/usr/local/cuda-8.0/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH"
# CuDNN-5.1
export LD_LIBRARY_PATH="/usr/local/cudnn-5.1/lib64:$LD_LIBRARY_PATH"
export C_INCLUDE_PATH="/usr/local/cudnn-5.1/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="/usr/local/cudnn-5.1/include:$CPLUS_INCLUDE_PATH"
export CUDA_HOME="/usr/local/cuda"
export DYLD_LIBRARY_PATH="$CUDA_HOME/lib:$DYLD_LIBRARY_PATH"

#-----
#- Go 
#-----
export GOPATH=$HOME/gopath
export PATH="$GOPATH:$GOPATH/bin:$PATH"

#--------------------
#- Terminal Colors
#--------------------
export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
export TERM=screen-256color       # for a tmux -2 session (also for screen)
# export TERM=rxvt-unicode-256color # for a colorful rxvt unicode session
eval `dircolors ~/.dircolors/dircolors.ansi-dark` 

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export T='/home/vik/vikkamath/vik-daily/2016/12/03'
export RNN='/home/vik/vikkamath/vik-daily/video-ladder/experiments/rnn_ladder'

#           _,     _   _     ,_
#       .-'` /     \'-'/     \ `'-.
#      /    |      |   |      |    \
#     ;      \_  _/     \_  _/      ;
#    |         ``         ``         |
#    |          I'M  BATMAN          |
#     ;    .-.   .-.   .-.   .-.    ;
#      \  (   '.'   \ /   '.'   )  /
#       '-.;         V         ;.-'

function batman() {
	declare -a batman_quotes=(
	"It's not who I am underneath, but what I do that defines me. - Batman"
	"Some men just want to watch the world burn. - Alfred"
	"Everything's impossible until somebody does it. - Batman"
	"The night is darkest just before the dawn. And I promise you. The dawn is coming. - Harvey Dent"
	"Why do we fall? So that we can learn to pick ourselves back up. - Batman"
	"You start pretending to have fun; you might even have a little by accident. - Alfred"
	"Our greatest glory is not in ever falling, but in rising every time we fall. - Batman"
	"Whatever doesn't kill you, simply makes you stronger. - Batman"
	"Endure, Master Wayne. Take it. They'll hate you for it, but that's the point of Batman, he can be the outcast. - Alfred"
	"Sometimes the truth isn't good enough, sometimes people need more. - Batman"
	"But as a symbol, as a symbol I can be incorruptible. - Batman"
	"I'm whatever Gotham needs me to be. - Batman"
	"Rachel, all- all this, it- it's not me, inside, I am, I am more. - Batman"
	"You either die a hero or live long enough to see yourself become the villain. - Batman"
	"If you're good at something, never do it for free. - The Joker"
	)

	rand=$((RANDOM % ${#batman_quotes[@]}))
	echo "${batman_quotes[$rand]}"
}

alias pp='batman'
