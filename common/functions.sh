## Messages
##################
# Code # Color   #
##################
#  00  # Off     #
#  30  # Black   #
#  31  # Red     #
#  32  # Green   #
#  33  # Yellow  #
#  34  # Blue    #
#  35  # Magenta #
#  36  # Cyan    #
#  37  # White   #
##################
function print {
    echo "\033[1;32m=> $1\033[0m";
}
function msg_checking {
    echo  "\033[1;32m=> $1 ✔\033[0m";
}
function msg_installing {
    echo  "\033[1;33m==> $1 [updating] ✔\033[0m";
}
function msg_install {
    echo  "\033[1;33m==> $1 [installing]: $ $2\033[0m";
}
function msg_ok {
    echo  "\033[1;32m==> $1 installed ✔\033[0m";
}
function msg {
    echo  "\033[0;32m$1\033[0m";
}
function msg_alert {
    echo "\033[1;31m✖ $1 ✖\033[0m";
}

## macOS Application check
function has_app {
    mdfind -name '$1.app'
}
