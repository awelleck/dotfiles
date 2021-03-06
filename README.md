# dotfiles
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)

Dotfiles on Unix/Linux are hidden configuration files. My goal is to consolidate and backup any configs I adopt and use GitHub as a way to sync them. I generally don't prefer a ton of customization and like to understand all configurations I enable. As I find additional configurations I will add them to this repository.

## Steps to Install

You can use `curl` to download the setup.sh script and avoid using git. The setup.sh script uses `curl` wherever downloading a file is needed:

`curl -O https://raw.githubusercontent.com/awelleck/dotfiles/master/setup.sh`

Give the script permission to execute:
`chmod +x setup.sh`

Run the setup.sh script:
`./setup.sh`

The setup.sh installation script will zip any dotfiles that already exist in the `$HOME` directory that would otherwise be overwritten. You can find your backed up, zipped dotfiles in the `$HOME/dotfiles_backup` directory that is created. The script is safe to re-run, the zip files will be named `yyyy.mm.dd-hh.mm.ss.zip`.

If you prefer to setup the files individually you can clone this repository:

`git clone https://github.com/awelleck/dotfiles.git` using HTTPS.

## Notes about .bash_profile vs .bashrc

Most login shells use the `.bashrc` file, for example Ubuntu's GNOME Terminal. Mac OSX is an exception, the Terminal.app runs a login shell each time a terminal window is opened and `.bash_profile` is called by default. I source my `.bashrc` file when my `.bash_profile` is called and keep any PATH settings in the former.

## License

This project is licensed under the GNU General Public License v3.0.
