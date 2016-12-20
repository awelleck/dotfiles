# If the .bashrc file exists, source
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

export EDITOR=/usr/bin/vim 		# Sets default editor
export CLICOLOR=1 			# Enable colors in terminal
LSCOLORS=exfxcxdxbxegedabagacad 	# Color scheme
alias qfind="find . -name " 		# qfind: Quickly search for file
alias qgrep="grep -nriI "		# qgrep: grep with line number from file, recursively, ignoring case, skipping binary files
