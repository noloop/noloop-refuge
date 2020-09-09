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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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

alias next='export $(dbus-launch); firejail --ignore=nodbus next'
alias emacs='export $(dbus-launch); emacs'

sudo() {
  if alias "$1" &> /dev/null ; then
    $(type "$1" | sed -E 's/^.*`(.*).$/\1/') "${@:2}"
  else
    command sudo "$@"
  fi
}

move_to_trash() {
  if [ $# == 0 ]; then
    echo "rm without arguments!"
    return 0
  elif [ $# == 1 ]; then
    if [ -f "$1" ] || [ -d "$1" ]; then 
      name="$1" 
    else 
      echo "$1 doesn't exist!"
      return 0
    fi	    
  elif [ $# == 2 ]; then
    if [ -f "$2" ] || [ -d "$2" ]; then
      name="$2"
    else
      echo "$2 doesn't exist!"
      return 0
    fi
  elif [ $# -gt 2 ]; then
    echo "what are you doing???"
    return 0    
  fi
  mkdir -p ~/Trash
  now="$(date +'%Hh-%Mm-%Ss-%dd-%mm-%Yy')"  
  id_name=$(basename "$name").$now
  mv "$name" ~/Trash/"$id_name"
  echo "$name has been moved to ~/Trash/$id_name"
  return 1
}

empty_trash() {
  if [ $# == 1 ]; then
    year="$1"y
  else
   year=""
  fi	  
  rm -rf ~/Trash/*$year
  rm -rf ~/Trash/.*$year
}

alias rm='move_to_trash'
alias mv='mv -i'
alias cp='cp -i'
alias xbps-fix='sudo xbps-remove void-repo-nonfree | sudo xbps-install void-repo-nonfree  | sudo xbps-remove -Oo | sudo xbps-install -Su'

export ANDROID_HOME="/home/noloop/Programs/Android/"
export ANDROID_NDK_ROOT="/home/noloop/Programs/Android/ndk-bundle/"

export NVM_DIR="/home/noloop/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
