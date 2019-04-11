eval (python3 -m virtualfish)
. /usr/share/autojump/autojump.fish
set -x GOPATH $HOME/work
set -x PATH $PATH:/usr/local/go/bin:$GOPATH/bin
set -x PATH $PATH:/home/$USER/miniconda3/bin
