# Path to your oh-my-zsh installation.
export ZSH=/Users/aarni/.oh-my-zsh

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
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/aarni/.rbenv/shims:/Users/aarni/.rbenv/bin:/Users/aarni/.jenv/shims:/Users/aarni/.jenv/bin"
export CLASSPATH=".:/usr/local/lib/antlr-4.0-complete.jar:$CLASSPATH"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
### Added by the Heroku Toolbelt
export NVM_DIR="/Users/aarni/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/usr/local/heroku/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'
alias tmux="TERM=screen-256color-bce tmux"
export TERM="screen-256color"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# aliases
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.5-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

### Client configurations
alias dot="cd /Users/aarni/git/dotfiles";
alias edu="cd /Users/aarni/Documents/code/tw/ProjetoDora/";
alias tw="cd /Users/aarni/Documents/code/tw/";
alias play="cd /Users/aarni/Documents/code/play";
alias code="cd /Users/aarni/Documents/code";
alias ev="vim /Users/aarni/.vimrc";
alias sv="source /Users/aarni/.vimrc";
alias ec="vim /Users/aarni/.vim/cheatsheet";
alias ez="vim /Users/aarni/.zshrc";
alias sz="source /Users/aarni/.zshrc";
alias eb="source /Users/aarni/buffer.md";
alias et="vim /Users/aarni/.tmux.conf";
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
