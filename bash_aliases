#!/usr/bin/env bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -1'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# NB: You MUST invoke `xhost +local:docker` to add the docker user to your X server, or this little hack doesn't work!
alias spm='docker run -d --rm -e DISPLAY=$DISPLAY -v /tmp:/tmp -v /tmp/.X11-unix:/tmp/.X11-unix --name mridoc ghcr.io/spm/spm-docker:docker-matlab pet'

alias octave='$HOME/software/octave-6.4.0/bin/octave --gui &'
alias zotero='$HOME/software/zotero/Zotero_linux-x86_64/zotero &'
alias rstudio='rstudio &'

alias reload='source ~/.bashrc'
alias cls='printf "\033c"'
alias status='git fetch && git status'

alias traggo_restart='docker run -p 3033:3030 -d -v /opt/traggo/data:/opt/traggo/data --name traggo traggo/server:latest'
alias traggo_up='docker start traggo'
alias traggo_down='docker stop traggo'

alias wekan_up='pushd ~/src/wekan/; docker-compose up -d; popd'
alias wekan_down='pushd ~/src/wekan/; docker-compose down; popd'


alias notebook='~/software/joplin/Joplin-2.7.15.AppImage &'

#### Tensorflow/Torch docker image quick launch lines ####
alias gwu_ag_project='pushd /home/pat/dev/ai-ml-workspace/informatics_projects/artificial_genomes; docker run --rm -it -v "$(pwd)":/proj -u $(id -u):$(id -g) --gpus all ag-image:latest;'
alias tf_container='docker run --rm -it -v "$(pwd)":/proj -u $(id -u):$(id -g) --gpus all --name flow home-tf-base:latest;'
alias lightning_container='docker run --rm -it -v "$(pwd)":/proj --gpus all --name torch pytorchlightning/pytorch_lightning;'
#######################
