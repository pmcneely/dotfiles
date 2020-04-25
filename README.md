# configs
General configuration files for uniform VIMing, BASHing, etc.

# Quickstart notes
(For any config files, remove the current one or give it a *.bak suffix)

Requires:
- git python3
Nice to haves:
- meld code tree ncdu bmon

For bash:
ln -s dotfiles/bashrc $HOME/.bashrc 
source ~/.bashrc

For vim:
(vim-gtk3 suggested, as it has the system clipboard available)
Follow the instructions for installation of Vundle at:
https://github.com/VundleVim/Vundle.vim

...and for setting up youcompleteme at:
https://github.com/ycm-core/YouCompleteMe/wiki/Full-Installation-Guide

For papercolor-theme:
https://github.com/NLKNguyen/papercolor-theme
See above link for language-specific sytax highlighting plugins

ln -s dotfiles/vimrc $HOME/.vimrc
In a new vim instance:
:Plugin update

For i3:
ln dotfiles/i3_config $HOME/.config/i3/config

To have a background using i3:
Download a fund picture for the wallpaper, then edit $HOME/.profile to include:
feh --bg-scale ~/Pictures/Abstract-Chameleon-Wallpapers-Hd-1920x1080.jpg

powerline:
See https://devpro.media/install-powerline-ubuntu/#install-powerline
NB: Click 'custom font' in terminal preferences to render powerline correctly!
(For preference I tend to select `ubuntu monospace 12` for the font selection
 --> This package doesn't appear to have source code available any longer :/ --sudo apt install powerline--
Instructions for powerline/python (child/descendant package?)
--- 
Source code at https://github.com/powerline/powerline
Instructions at https://powerline.readthedocs.io/en/latest/installation.html
Font installation at https://itsfoss.com/install-fonts-ubuntu/
-- spoliers: sudo apt install font-manager


#########################################################################################
Notes
i3 configuration is located at ~/.config/i3/config, ignore other paths
To update powerline configurations

mkdir -p $HOME/.config/powerline
cp -R /usr/share/powerline/config_files/* \
      $HOME/.config/powerline/
Restart the powerline daemon with `powerline-daemon --replace`
#########################################################################################

