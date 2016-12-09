#Automate installation of dotfiles
backup_dir=$HOME/dotfiles_backup
vimrc_file=$HOME/.vimrc
vim_colors=$HOME/.vim/colors/wombat256dave.vim
vim_colors_dir=$HOME/.vim/colors
gitconfig=$HOME/.gitconfig
bash_profile=$HOME/.bash_profile


FILES[0]=$vimrc_file
FILES[1]=$vim_colors
FILES[2]=$gitconfig
FILES[3]=$bash_profile

echo "Setup script for dotfiles:"
echo "=========================="

#Check if /dotfile_backup exists, create if not
if [ -d $backup_dir ]; then
	echo "The /dotfile_backup dir exists"
	for (( a=1; ; a++ ))
	do
		if [ ! -d $backup_dir$a ]; then
			echo "Creating $backup_dir$a"
			mkdir $backup_dir$a

			for (( b=0; b<4; b++ ))
			do
				if [ -f ${FILES[$b]} ] && [ -d $backup_dir$a ]; then
					echo "The following file exists: ${FILES[$b]}"
					mv ${FILES[$b]} $backup_dir$a
				elif [ ! -f ${FILES[$b]} ]; then
					echo "The following file does not exist: ${FILES[$b]}"
				fi
			done

			break
		elif [ -d $backup_dir$a ]; then
			continue
		fi
	done
elif [ ! -d $backup_dir ]; then
	echo "Creating $backup_dir"
	mkdir $backup_dir

	for (( b=0; b<4; b++ ))
	do
		if [ -f ${FILES[$b]} ] && [ -d $backup_dir ]; then
			echo "The following file exists: ${FILES[$b]}"
			mv ${FILES[$b]} $backup_dir
		elif [ ! -f ${FILES[$b]} ]; then
			echo "The following file does not exist: ${FILES[$b]}"
		fi
	done
fi

#Check if ~/.vim/colors exists, if not create it
if [ -d $vim_colors_dir ]; then
	echo "The ~/.vim/colors directory alreay exists"
elif [ ! -d $vim_colors_dir ]; then
	echo "Creating .vim/colors directory"
	mkdir -p $HOME/.vim/colors
fi

current_dir=$(pwd)
cd $HOME/ && curl -sS -O https://raw.githubusercontent.com/awelleck/dotfiles/master/.vimrc
cd $HOME/.vim/colors && curl -sS -O https://raw.githubusercontent.com/davb5/wombat256dave/master/colors/wombat256dave.vim
cd $HOME/ && curl -sS -O https://raw.githubusercontent.com/awelleck/dotfiles/master/.gitconfig
cd $HOME/ && curl -sS -O https://raw.githubusercontent.com/awelleck/dotfiles/master/.bash_profile
cd $current_dir
echo "Done!"
