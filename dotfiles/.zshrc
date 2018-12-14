# Path to your oh-my-zsh installation.
export ZSH=/Users/anikarni/.oh-my-zsh
export ZSH_CACHE_DIR=$HOME/.zsh
eval "$(direnv hook zsh)"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git svn npm bower brew osx z)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/anikarni/.rbenv/shims:/Users/anikarni/.rbenv/bin:/Users/anikarni/.jenv/shims:/Users/anikarni/.jenv/bin"
export CLASSPATH=".:/usr/local/lib/antlr-4.0-complete.jar:$CLASSPATH"
export PYTHONPATH=`brew --prefix`/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH=/Users/anikarni/code/caffe/python:$PYTHONPATH
# export MANPATH="/usr/local/man:$MANPATH"
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
### Added by the Heroku Toolbelt
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
export PATH="/usr/local/heroku/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'
alias tmux="TERM=screen-256color-bce tmux"
export TERM="screen-256color"

export LC_ALL='en_US.UTF-8'

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# aliases
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.5-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Client configurations
alias dot="cd /Users/anikarni/git/dotfiles";
alias edu="cd /Users/anikarni/Documents/code/tw/ProjetoDora/";
alias tw="cd /Users/anikarni/Documents/code/tw/";
alias play="cd /Users/anikarni/Documents/code/play";
alias code="cd /Users/anikarni/Documents/code";
alias ev="vim /Users/anikarni/.vimrc";
alias sv="source /Users/anikarni/.vimrc";
alias ec="vim /Users/anikarni/.vim/cheatsheet";
alias ez="vim /Users/anikarni/.zshrc";
alias sz="source /Users/anikarni/.zshrc";
alias eb="source /Users/anikarni/buffer.md";
alias et="vim /Users/anikarni/.tmux.conf";
alias gupp="gup && ggpush";
alias svn17='/usr/bin/svn';
alias svn19='/usr/local/bin/svn';

svn () {
	svn17 "$@" 2> /tmp/$$.svn.out
	# [
  # cat /tmp/$$.svn.out | grep "Subversion 1.9" | wc -l | awk ' { print $1 } ' 
  # -gt 0 ] \
	# && svn19 "$@"
	rm /tmp/$$.svn.out
}

function fancy-ctrl-z () {
 if [[ $#BUFFER -eq 0 ]]; then
   BUFFER="fg"
   zle accept-line
 else
   zle push-input
   zle clear-screen
 fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
