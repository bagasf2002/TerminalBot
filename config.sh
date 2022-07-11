#!bin/sh

# put your commands to install extra shit and configure it below:
# Check your logs on heroku to see if you were sucessfull
# default dir is /home, the stuff folder's dir is /home/stuff/

echo "NOTICE: config.sh is runnning"

### EXAMPLE - Gclone:

## To install gclone:

# apt-get install -y systemd golang unzip
# mkdir -p /home/.config/rclone/
# curl -s https://raw.githubusercontent.com/oneindex/script/master/gclone.sh | sudo bash

## To configure gclone paste your config in between both "EOF", eg:

# echo > /home/.config/rclone/rclone.conf << EOF
# [blah]
# dskjkghs
# skfg=jsdhgjk
# longasstoken=shdgskdhgdsg:4564657657215412945^#%^*^$*
# EOF

sudo apt update
apt-get upgrade -y
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install -y yarn
sudo curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
