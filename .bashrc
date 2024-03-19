# .bashrc
# Add this lines at the top of .bashrc:
[[ $- == *i* ]] && source /path/to/blesh/ble.sh --noattach

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

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

#
#Alias Setting#
#
alias cl='clear'

#
# Ansible Alias
#
alias vi='/usr/bin/vim'
alias ans='ansible'
alias anp='ansible-playbook'
alias and='ansible-doc'
alias anpr='ansible-playbook -C'
alias anpchk='ansible-playbook --syntax-check'
alias anx='ansible-galaxy'
alias anv='ansible-vault'
alias ansfs='ansible localhost -m setup | grep "ansible_*"'
alias anx='ansible-galaxy'
#
# Sfecific configuration
#
export PS1='\[\e[31;1m\][\u@\h\[\e[33;1m\] \w]\$ \[\e[m\]'
alias vi='/usr/bin/vim'
alias chrome='google-chrome'
alias vscode='code'

[[ ${BLE_VERSION-} ]] && ble-attach
