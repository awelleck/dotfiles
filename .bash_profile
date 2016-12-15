# If the .bashrc file exists, source
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

export EDITOR=/usr/bin/vim 		#sets default editor
export CLICOLOR=1 			#enable colors in terminal
LSCOLORS=exfxcxdxbxegedabagacad 	#color scheme
alias qfind="find . -name " 		#qfind: Quickly search for file
