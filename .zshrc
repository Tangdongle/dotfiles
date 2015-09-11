# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

####################
#   Vi Mode
####################
set editing-mode vi
set blink-matching-paren on


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="zhann" #Simple
#ZSH_THEME="bira" 
#ZSH_THEME="darkblood" 


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode osx)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/opt/ImageMagick/bin:/usr/local/MacGPG2/bin:/usr/texbin"
# export MANPATH="/usr/local/man:$MANPATH"
if [[ $OSTYPE =~ "darwin" ]]; then
	export SVN_EDITOR='mvim -f'
	export GIT_EDITOR='mvim -f'
	export PATH="/Applications/Xcode.app/Contents/Developer/usr/libexec/git-core":$PATH
elif [[ $OSTYPE == "linux-gnu" ]]; then
	which gvim &>/dev/null
	if [ $? -eq 0 ]; then
		export SVN_EDITOR='gvim'
		export GIT_EDITOR='gvim'
	else
		echo "GVIM not found, falling back to VIM"
		export SVN_EDITOR='vim'
		export GIT_EDITOR='vim'
	fi
fi

minify() {
    file=$1 
   file=${file%%.*}
   if [[ -x "$HOME/scripts" ]]; then
		java -jar "$HOME/scripts/yui.jar" $file.js -o $file.min.js
	fi
}

alias jsmin=minify

if [[ -x "~/git-tf" ]]; then
	export PATH="~/git-tf":$PATH
fi

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export WORKON_HOME=$HOME/.virtualenvs

export PATH="/usr/local/mysql/bin:$PATH"

export PATH=~/scripts:$PATH
export PATH=/opt/subversion/bin:$PATH

source $ZSH/oh-my-zsh.sh

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

alias 2.="cd ../..; pwd"
alias 3.="cd ../../..; pwd"
alias 4.="cd ../../../..; pwd"

#============================================================
# SS build commands
#============================================================
alias ss-build='sake dev/build'
alias ss-build-new='sake dev/build | grep +'
alias ss-build-f='sake dev/build "flush=all"'


alias fuck='sudo $(history -p \!\!)'
alias vm3='echo vm3.activcloud.com.au'

if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
	source /usr/local/bin/virtualenvwrapper.sh
fi

alias start_mysql='sudo $MYSQL_HOME/bin/mysqld_safe &'
alias stop_mysql='sudo $MYSQL_HOME/bin/mysqladmin shutdown'

alias www='cd ~/Documents/workspace/www'
alias old-dev='cd ~/Documents/workspace/www/old-dev-backups/MILLENIUM\ TAKE\ II'

autoload -U zmv
alias zmv="noglob zmv -W"
export VMAIL_HTML_PART_READER='elinks -dump'
export VMAIL_VIM=mvim

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

function zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
     zle reset-prompt
}

function copyDatabase {
	a= ssh -p $1 $2@$3 "mysqldump --create-options --add-drop-database -B -u $2_db -p$4 $2_db" | mysql -u root $2_db

}

zle -N zle-keymap-select

# Jump back to vim using ctrl-z
fancy-ctrl-z () {
	if [[ $#Buffe -eq 0 ]]; then
		BUFFER="fg"
		zle accept-line
	else
		zle push-input
		zle clear-screen
	fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#export PAGER=/usr/local/bin/vimpager
alias less=$PAGER
alias zless=$PAGER

alias -g X='| xargs'


alias svnextern="svn propedit svn:externals ."
export PATH="/usr/local/sbin:$PATH"

setopt EXTENDED_HISTORY

#Virtual Env
function s()
{
    screen -t "$@" /usr/bin/ssh "$@"
}

