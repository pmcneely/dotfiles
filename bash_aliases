alias reload='source ~/.bashrc'
alias cls='printf "\033c"'
alias dkill="docker rm $(docker ps -a -f status=exited -f status=created -q)"
alias dall_kill="docker rm -f $(docker ps -a -q)"
