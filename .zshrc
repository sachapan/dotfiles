# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
#ZSH_THEME="candy"
#ZSH_THEME="agnoster"
#ZSH_THEME="sporty_256"
#ZSH_THEME="nebirhos"
#ZSH_THEME="awesomepanda"
#ZSH_THEME="xiong-chiamiov"

#ZSH_THEME="xiong-chiamiov-plus"

# MAybes
ZSH_THEME="tjkirch"

#ZSH_THEME="rkj-repos"
#ZSH_THEME="wedisagree"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
#    themes
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# Sacha Stuff
# disable audible irritating beeps
unsetopt BEEP
# source aliases from .aliases if available
#if [[ -f "$HOME/.aliases" ]]; then source "$HOME/.aliases"
source $HOME/.aliases

# Sacha vi mode stuff
# replaced with vi-mode plugin?
#bindkey -v
export KEYTIMEOUT=1
#bindkey '^P' up-history
#bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
#bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
#bindkey '^r' history-incremental-search-backward

# ignore case in autocompletions
#bind 'set completion-ignore-case on'
#Only autocomplete directories when using cd command
#complete -d cd
#export RPROMPT="%{$fg[green]%}[INSERT]%{$reset_color%}"
# only run neofetch if it is available
if [ -x /usr/bin/neofetch ]; then neofetch; fi
# June 28, 2021
# Changing tmux window name
#tmux set-option allow-rename off

#set_tmux_window_name() {
#    [[ -z "$TMUX" ]] && return
#    [[ -z "$1" ]] && tmux rename-window `hostname -s` || tmux rename-window $1
#}
#Sept 13, 2021
#commenting out since passing command line into an ssh command isn't working with
#this configuration
#ssh() {
#    tmux set-option allow-rename off 1>/dev/null
#    tmux rename-window "$*"
#    command ssh "$*"
#    tmux set-option allow-rename on 1>/dev/null
#}
#    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
#        tmux rename-window "$(echo $* | cut -d @ -f 2)"
#        command ssh "$@"
#        tmux set-window-option automatic-rename "on" 1>/dev/null
#    else
#        command ssh "$@"
#    fi
#}
#Delete a given line number in the known_hosts file.
knownrm() {
 re='^[0-9]+$'
 if ! [[ $1 =~ $re ]] ; then
   echo "error: line number missing" >&2;
 else
   sed -i "$1d" ~/.ssh/known_hosts
 fi
}
