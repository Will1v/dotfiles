# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias edbash='vim ~/.bashrc; source ~/.bashrc'
alias ll='ls -lah'
alias lrt='ls -lahrt'
alias sql='sudo mysql -u root -p'

function lrtg
{
	if [[ $# -eq 1 ]]; then
		target_dir="./"
		pattern=$1
	elif [[ $# -eq 2 ]]; then
		target_dir=$1
		pattern=$2
	else
		printf "Usage: lrtg [target_dir] <grep pattern>\n" 2>&1
		return 2
	fi
	ls -halrt ${target_dir} | grep -i ${pattern}
}
