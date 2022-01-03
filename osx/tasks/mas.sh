#!/usr/bin/env bash

source ~/.dotfiles/common/functions.sh

if ! has_app "The Unarchiver"; then
    msg_install "The Unarchiver"
    mas install 425424353
    msg_ok "OK"
fi


if ! has_app "Flycut"; then
    msg_install "Flycut"
    mas install 442160987
    msg_ok "OK"
fi

if ! has_app "Amphetamine"; then
    msg_install "Amphetamine"
    mas install 937984704
    msg_ok "OK"
fi

if ! has_app "GIPHY CAPTURE"; then
    msg_install "GIPHY CAPTURE"
    mas install 668208984
    msg_ok "OK"
fi

if ! has_app "Flow"; then
    msg_install "Flow"
    mas install 1423210932
    msg_ok "OK"
fi

if ! has_app "Bear"; then
    msg_install "Bear"
    mas install 1091189122
    msg_ok "OK"
fi
