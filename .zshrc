# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(brew docker docker-compose git mvn sublime sublime-merge)

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias jdk11="export JAVA_HOME=`/usr/libexec/java_home -v 11`"
alias jdk17="export JAVA_HOME=`/usr/libexec/java_home -v 17`"
alias jdk21="export JAVA_HOME=`/usr/libexec/java_home -v 21`"
alias jdklatest="export JAVA_HOME=`/usr/libexec/java_home -v 23`"
alias kitty_update="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
