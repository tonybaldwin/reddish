#!/bin/bash

##############################################################
# installation script for reddish                            #
# red matrix posting script in  bash by tony baldwin         #
# http://tonyb.us/reddish                                    #
# released according to the terms of the GNU GPL v.3 or later#
##############################################################

if [ != "$HOME/bin/" ]; then
	mkdir $HOME/bin/
	$PATH=$PATH:/$HOME/bin/
	export PATH
fi

editor="/usr/bin/vim"

echo "installing reddish ... "
cp reddi.sh $HOME/bin/reddi.sh
chmod +x $HOME/bin/reddi.sh

echo "Creating config files ... "
echo "# reddi.sh config " > $HOME/.reddi.conf
read -p "Enter your Red username (e-mail address): " uname
read -p "Enter your Red password: " pwd
read -p "Enter your Red site url (no trailing slash, i.e. https://red.free-haven.org) " rurl
read -p "Where do you wish to keep your post files? (such as ~/Documents/rposts/ This time DO include trailing slash.): " rpath
read -p "What is your prefered editor? (default /usr/bin/vim): " editor
read -p "What is your prefered web browser? (i.e. /usr/bin/iceweasel) " browser
echo "user=$uname" >> $HOME/.reddi.conf
echo "pass=$pwd" >> $HOME/.reddi.conf
echo "rurl=$rurl" >> $HOME/.reddi.conf
echo "rpostdir=$rpath" >> $HOME/.reddi.conf
echo "editor=$editor" >> $HOME/.reddi.conf
echo "browser=$browser" >> $HOME/.reddi.conf

echo "Installation complete!
To use reddi.sh, simply type "reddi.sh" at the command line and follow the prompts.
Enjoy! 
tony https://tonybaldwin.info/channel/software"

exit
