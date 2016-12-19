#!/bin/bash

backup_dir=$HOME/dotfiles_backup
FILENAME=`date +%Y.%m.%d-%H.%M.%S`
tmp_dir=/tmp/dotfiles_$FILENAME

vimrc_file=$HOME/.vimrc
vim_colors=$HOME/.vim/colors/wombat256dave.vim
vim_colors_dir=$HOME/.vim/colors
gitconfig=$HOME/.gitconfig
bash_profile=$HOME/.bash_profile

#Array for dotfiles
FILES=($vimrc_file $vim_colors $gitconfig $bash_profile)


echo "Setup script for dotfiles:"
echo "=========================="

#Check if /tmp/dotfiles exists, if not create it
if [ -d $tmp_dir ]; then
	echo "Error: the $tmp_dir directory already exists"
elif [ ! -d $tmp_dir ]; then
	mkdir -p $tmp_dir
fi


#Check if ~/dotfile_backup exists, if not create it
if [ -d $backup_dir ]; then
	echo "The /dotfile_backup directory already exists"
elif [ ! -d $backup_dir ]; then
	echo "Creating dotfiles_backup directory"
	mkdir $backup_dir
fi


#Loop through dotfiles, move them to /tmp if any exist
for (( a=0; a<${#FILES[@]}; a++ ))
do
	if [ -f ${FILES[$a]} ] && [ -d $backup_dir ]; then
		echo "The following file exists: ${FILES[$a]}"
		mv ${FILES[$a]} $tmp_dir
	elif [ ! -f ${FILES[$a]} ]; then
		echo "The following file DOES NOT exist: ${FILES[$a]}"
	fi
done


#Zip and move .zip to ~/dotfiles_backup
cd /tmp
zip -r $FILENAME.zip ./dotfiles_$FILENAME
mv $FILENAME.zip $backup_dir


#Check if ~/.vim/colors exists, if not create it
if [ -d $vim_colors_dir ]; then
	echo "The ~/.vim/colors directory alreay exists"
elif [ ! -d $vim_colors_dir ]; then
	echo "Creating .vim/colors directory"
	mkdir -p $vim_colors_dir
fi


current_dir=$(pwd)
cd $HOME/ && curl -sS -O https://raw.githubusercontent.com/awelleck/dotfiles/master/.vimrc
cd $HOME/.vim/colors && curl -sS -O https://raw.githubusercontent.com/davb5/wombat256dave/master/colors/wombat256dave.vim
cd $HOME/ && curl -sS -O https://raw.githubusercontent.com/awelleck/dotfiles/master/.gitconfig
cd $HOME/ && curl -sS -O https://raw.githubusercontent.com/awelleck/dotfiles/master/.bash_profile
cd $current_dir

#Cleanup /tmp/dotfiles directory
rm -r $tmp_dir
echo "Done!"
