#!/bin/bash
apt-get -y install fluxbox slim xinit virtualbox-guest-x11
fbset -f ~/.fluxbox/backgrounds/background.png
service slim start
