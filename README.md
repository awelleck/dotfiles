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

The setup.sh installation script will move any dotfiles that already exits in the `$HOME` directory that would otherwise be overwritten. You can find your already existing dotfiles in the `dotfiles_backup` directory that is created. The script is safe to re-run, the `dotfile_backup` directory won't get overwritten, a new `dotfiles_backup1` etc. will be created.

If you prefer to setup the file individually you can clone this repository:

`git clone https://github.com/awelleck/dotfiles.git` using HTTPS.

## TODO
* Add .bash_profile
* Change lyla vim color to wombat256dave
* Clean up setup.sh output

## License

This project is licensed under the GNU General Public License v3.0.
