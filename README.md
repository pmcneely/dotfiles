Assuming an Ubuntu image...

1.  `sudo apt update && sudo apt install make gcc perl`
2.  Install Guest Additions
3.  `sudo apt install -y git vim-gtk3 curl python3-pip`
4.  `sudo snap install code --classic`
5.  Install powerline fonts [source](https://github.com/powerline/fonts):

- Linux bash:

```bash
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```
- WSL Bash: Follow instructions [here](https://gist.github.com/stramel/658d702f3af8a86a6fe8b588720e0e23)


- Next, set the terminal preferences to a `* for Powerline` font (Terminal -> Hamburger Menu -> Profiles (Current Profile) -> Custom Font). Currently I like `Go Mono for Powerline Regular`.

6.  Get oh-my-bash:
    - `bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"`
    - Adjust settings appropriately
7.  Install [nvm](https://github.com/nvm-sh/nvm)
    - `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash`
    - Install the latest node/npm lts: `nvm install --lts`
8.  `git clone git@github.com:pmcneely/dotfiles.git`
    - Adjust theme and aliases as appropriate
9.  Turn `Settings -> Privacy -> Screen Lock` to "Off"
10. Install python virtualenvwrapper (could be the only `sudo pip` command ever needed!)
    - See [source](https://virtualenvwrapper.readthedocs.io/en/latest/install.html)
    - `sudo pip install virtualenvwrapper`
11. Update oh-my-bash aliases, dotfiles settings, and bash fragments (from dotfiles) as appropriate
12. Configure vim:
    - Install [vundle](https://github.com/VundleVim/Vundle.vim)
        - `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
        - `ln -s dotfiles/vimrc .vimrc`
        - `vim .`
        - `:PluginInstall`
    - Install and configure [`youcompleteme`](https://github.com/ycm-core/YouCompleteMe)
        - Install required headers and programs: `sudo apt install -y exuberant-ctags cmake`
        - Install support for other languages: `sudo apt install -y mono-complete golang default-jdk`

```
$ cd ~/.vim/bundle/youcompleteme
$ python3 install.py --all
```

13. On the host machine, run:

```
# See if vboxusers already exists
$ getent group | grep vboxusers
# If not, add the group
$ sudo groupadd vboxusers
# Allow hardware access to e.g. USB media
$ sudo usermod -aG vboxusers $USER
```

14. In the Guest machine, run:

```
$ sudo usermod -aG vboxsf $USER
```

14.1 If running Docker:

```
sudo usermod -aG docker $USER
```

(These commands allow the virtual machine to mount e.g. USB 3.0 devices and shared folders with the host) [see here](https://askubuntu.com/a/377781)
15. ...`profit?`
