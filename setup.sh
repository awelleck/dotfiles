#Automate installation of dotfiles
vim_colors=$HOME/.vim/colors
vimrc_file=$HOME/.vimrc
echo "Setup script for dotfiles:"

#Check if ~/.vim/colors exists, if not create it
if [ -d $vim_colors ]; then
	echo "The ~/.vim/colors directory alreay exists."
else
	echo "Creating .vim/colors directory..."
	mkdir "$HOME/.vim/colors"
fi

#Check if a .vimrc file exits, if not curl from GitHub
if [ -f $vimrc_file ]; then
	echo "A .vimrc file already exists."
else
	echo "Using curl to download .vimrc file..."
	curl -o .vimrc https://raw.githubusercontent.com/awelleck/dotfiles/master/.vimrc
fi
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/awelleck/dotfiles/master/.vimrc)"
