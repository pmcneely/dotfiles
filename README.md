## configs
General configuration files for running in a Linux environment. Also useful notes learned from a fresh VM installation of ubuntu 20.04

## For VirtualBox guest additions
```
sudo apt install make gcc perl
```
Then select "Insert Guest Additions" in VirtualBox `devices` options


## "Quickstart" notes
(For any config files, remove the current one or give it a *.bak suffix if you prefer)

Requires:
```
sudo apt install ncdu tree cloc bmon meld python3-pip i3 feh cmake exuberant-ctags
```
Nice to have a vim with system clipboard and python3 built in
```
sudo apt install vim-gtk3
```
**Make sure to tell VirtualBox to mount an external location before adding the share directory**
```
sudo adduser $USER vboxsf
reboot
```
I use a shared directory call with my host OS; to confirm it is working
```
ls -lah /media/host_directory/
```

Install git:
```
sudo apt install git
```
Meld is clearly my preferred tool for handling git diffs/merge conflicts:
```
git config --global user.email "email@domain.addr"
git config --global user.name "Your Name Here"
git config --global diff.tool meld
git config --global difftool.prompt false
git config --global merge.tool meld
git config --global mergetool.prompt false
```
## Install python virtual environments

```
sudo pip3 install virtualenv
sudo pip3 install virtualenvwrapper
```

## Install a viable docker environment
``` 
sudo apt install docker.io
sudo groupadd docker  # Likely redundant, but just in case
sudo usermod -aG docker $USER
```
- Check the docker installation
```
reboot
docker run hello-world
```

Clone the dotfiles repository:
```
git clone https://github.com/pmcneely/dotfiles.git
```

## Replace the vanilla bash
```
rm .bashrc
ln -s dotfiles/bashrc .bashrc
source ~/.bashrc
```

## Optional - make Vim awesome with tools
### Replace the vimrc: See https://github.com/VundleVim/Vundle.vim#about
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
### Install YouCompleteMe requirements
- See https://github.com/ycm-core/YouCompleteMe/wiki/Full-Installation-Guide
```
cd ~
mkdir ycm_build
cd ycm_build

cmake -G "Unix Makefiles" . ~/.vim/bundle/youcompleteme/third_party/ycmd/cpp
cmake --build . --target ycm_core
cd ~/.vim/bundle/youcompleteme/third_party/ycmd/third_party/watchdog_deps/watchdog/
python3 setup.py build --build-base=build/3 --build-lib=build/lib3
```
### Details on PaperColor
```
For papercolor-theme:
https://github.com/NLKNguyen/papercolor-theme
```
## Install VS Code (Recommended over Vim...)
```
sudo snap install code --classic
```

## i3 Activation (not for the uninitiated...)
Activate i3 (if desired: **NB** This is not a standard/'typical' user-friendly environment!)
```
reboot
```
--> Select i3 before login w/password
```
rm .config/i3/config
ln dotfiles/i3_config .config/i3/config
```
NB - i3 configuration is located at ~/.config/i3/config, ignore other paths

- Activate i3 config with <meta, likely Windows key> + shift + c
- Add a background with:
```
cp /media/host_directory/CoolJpeg.jpg Pictures/
echo "feh --bg-scale ~/Pictures/CoolJpeg.jpg" >> .profile
```


powerline:
See https://github.com/powerline/powerline (or maybe...?) https://devpro.media/install-powerline-ubuntu/#install-powerline
NB: Click 'custom font' in terminal preferences to render powerline correctly!
(For preference I tend to select `ubuntu monospace 12` for the font selection
- These packages are both various states of decay/benign neglect. Handle with some caution
### Powerlikne notes - WIP
User configuration is expected at:
```
mkdir -p $HOME/.config/powerline
cp -R /usr/share/powerline/config_files/* \
      $HOME/.config/powerline/
```
Restart the powerline daemon with `powerline-daemon --replace`

