#setopt nocorrectall

export QT_QPA_PLATFORMTHEME=qt5ct
export VAGRANT_DEFAULT_PROVIDER=virtualbox
#
#https://deductivelabs.com/en/using-true-color-vim-tmux/
#export TERM="xterm-256color"
export TERM="screen-256color"

export EDITOR=vim
# BEGIN archlinux
export EDITOR=nvim
alias vim=nvim
alias bc='bc -l'
# END archlinux
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alteriks"

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

ZSH_TMUX_FIXTERM_WITH_256COLOR="screen-256color"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
#TODO: dircycle  Ctrl+Shift+Left/Right wit konsole/yakuake (moving tab)
#TODO: dirhistory
#TODO: install tmuxinator https://github.com/tmuxinator/tmuxinator
#TODO: fasd https://github.com/clvv/fasd
#plugins=(dircycle fasd git history-substring-search systemd taskwarrior tmux tmuxinator web-search)
plugins=(dircycle fasd fancy-ctrl-z git history-substring-search safe-paste systemd taskwarrior tmux tmuxinator web-search)
alias pushd=' pushd'
alias cls='clear && echo -en "[3J"'


DEFAULT_USER="kdajka"
if [[ $UID -eq 1001 || $UID -eq 1000 ]]; then 
	ZSH_TMUX_AUTOSTART=true
	ZSH_TMUX_AUTOQUIT=false
fi
HIST_IGNORE_SPACE=0


# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH:/home/dajka_krzy_ext/.gem/ruby/2.4.0/bin
# export MANPATH="/usr/local/man:$MANPATH"

#homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias windows="rdesktop -r disk:local=/home/kdajka -u dajka_krzy_ext -d GIGA -k pl -g 1920x1172 10.3.102.19"

bindkey "[[1;5D" backward-word
bindkey "[[1;5C" forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
#for tmux
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OD" backward-word
bindkey "^[OC" forward-word
ssh() {                                       
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        tmux rename-window "$(if [ $# = 1 ]; then echo $1; else echo $* | egrep -o '(\w+@)?\w+\.(\w|\.)+'; fi )"
        command ssh "$@"
        tmux set-window-option automatic-rename "on" 1>/dev/null
    else
        command ssh "$@"
    fi
}
