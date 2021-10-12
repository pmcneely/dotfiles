# Define colors
_BLUE='\[\e[1;34m\]'
_GREEN='\[\e[1;32m\]'
_WHITE='\[\e[1;0m\]'
_RED='\[\e[1;31m\]'
_BLACK='\[\e[1;30m\]'
_YLWBGD='\[\e[2;43m\]'
_REDBGD='\[\e[1;41m\]'
_BLKBGD='\[\e[40m\]'

LOCAL_ALIAS=T-Rex

if [ -n "$SSH_CLIENT" ]; then
    if [ -n "$REMOTE_ALIAS" ]; then
	_REMOTE_ALIAS=$REMOTE_ALIAS
        #💻
    	_CLIENT="$_YLWBGD$_BLUE💻 $_REMOTE_ALIAS$_BLKBGD$_BLUE"
    else
	HN=$(hostname -a | awk '{print $1 }' )
	case $HN in
	    (*"SMHS"*) _REMOTE_ALIAS=GWU-STUDENT-SERVER;;
	    (*) _REMOTE_ALIAS=REMOTE;;
	esac
    	_CLIENT="$_YLWBGD$_BLUE💻 $_REMOTE_ALIAS$_BLKBGD$_BLUE"
    fi
else
    if [ -n $LOCAL_ALIAS ]; then
        _CLIENT="$_GREEN💻 $LOCAL_ALIAS$_WHITE"
    else
        _CLIENT="$_GREEN💻 (LOCAL)$_WHITE"
    fi
fi

export _CLIENT
