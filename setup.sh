#Automate installation of dotfiles
backup_dir=$HOME/dotfiles_backup
vimrc_file=$HOME/.vimrc
vim_colors=$HOME/.vim/colors/lyla.vim
bash_profile=$HOME/.bash_profile
alias_file=$HOME/.alias
gitconfig=$HOME/.gitconfig

FILES[0]=$vimrc
FILES[1]=$vim_colors
FILES[2]=$bash_profile
FILES[3]=$alias_file
FILES[4]=$gitconfig

echo "Setup script for dotfiles:"

#check if /dotfile_backup exists, create if not
if [ -d $backup_dir ]; then
	echo "The /dotfile_backup dir exists"
	for (( a=1; ; a++ ))
	do
		if [ ! -d $backup_dir$a ]; then
			echo "Creating $backup_dir$a"
			mkdir $backup_dir$a
			break
		elif [ -d $backup_dir$a ]; then
			continue
		fi
	done
elif [ ! -d $backup_dir ]; then
	echo "Creating $backup_dir"
	mkdir $backup_dir
fi

#check if each of the files in the array exist
for (( b=0; b<5; b++ ))
do
	if [ -f ${FILES[$b]} ] && [-d $backup_dir ]; then
		echo "The following file exists: ${FILES[$b]}"
		mv ${FILES[$b]} $backup_dir
	elif [ -f ${FILES[$b]} ] && [-d $backup_dir$a ]; then
		echo "THe following file exists: ${FILES[$b]}"
		mv ${FILES[$b]} $backup_dir$a
	elif [ ! -f ${FILES[$b]} ]; then
		echo "The following file does not exist: ${FILES[$b]}"
	fi
done

current_dir=$(pwd)
#cd $HOME/ && curl -sS -O
#cd $HOME/ && curl -sS -O
#cd $HOME/.vim/colors && curl -sS -O
#cd $HOME/ && curl -sS -O
cd $current_dir

#Check if ~/.vim/colors exists, if not create it
#if [ -d $vim_colors ]; then
#	echo "The ~/.vim/colors directory alreay exists."
#else
#	echo "Creating .vim/colors directory..."
#	mkdir "$HOME/.vim/colors"
#fi
#
##Check if a .vimrc file exits, if not curl from GitHub
#if [ -f $vimrc_file ]; then
#	echo "A .vimrc file already exists."
#	mkdir "$HOME/old_configs"
#	cp $vimrc_file $HOME/old_configs
#	curl -o .vimrc https://raw.githubusercontent.com/awelleck/dotfiles/master/.vimrc
#else
#	echo "Using curl to download .vimrc file..."
#	curl -o .vimrc https://raw.githubusercontent.com/awelleck/dotfiles/master/.vimrc
#fi
