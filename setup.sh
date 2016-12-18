#new_setup.sh

backup_dir=$HOME/dotfiles_backup
tmp_dir=$HOME/tmp/dotfiles

vimrc_file=$HOME/.vimrc
vim_colors=$HOME/.vim/colors/wombat256dave.vim
vim_colors_dir=$HOME/.vim/colors
gitconfig=$HOME/.gitconfig
bash_profile=$HOME/.bash_profile

FILES=($vimrc_file $vim_colors $gitconfig $bash_profile)


echo "Setup script for dotfiles:"
echo "=========================="

#Check if /tmp/dotfiles exists, if not create it
if [ ! -d $tmp_dir ]; then
	mkdir -p $tmp_dir
elif [ -d $tmp_dir ]; then
	echo "The /tmp/dotfiles directory already exists"
fi


for (( b=0; b<${#FILES[@]}; b++ ))
do
	if [ -f ${FILES[$b]} ] && [ -d $backup_dir$a ]; then
		echo "The following file exists: ${FILES[$b]}"
		mv ${FILES[$b]} $tmp_dir
	elif [ ! -f ${FILES[$b]} ]; then
		echo "The following file DOES NOT exist: ${FILES[$b]}"
	fi
done


#Check if /dotfile_backup exists, if not create it
if [ ! -d $backup_dir ]; then
	mkdir $backup_dir
elif [ -d $backup_dir ]; then
	echo "The /dotfile_backup directory already exists"
fi

#Zip and mv /dotfiles dir to /dotfiles_back
#Name .zip 2016.12.16-23:01.zip
TIME=`date +%H.%M`
DATE=`date +%Y.%m.%d`

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

#Cleanup /tmp/dotfiles directory
#rm -r $tmp_dir
echo "Done!"
