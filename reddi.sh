#!/bin/bash
 
# update Red with bash, vim and curl
# I put this in my path as "reddi.sh"
# by tony baldwn, http://tonybaldwin.me
# on red at https://red.free-haven.org/channel/tony
# released according to the Gnu Public License, v.3
 
source ~/.reddi.conf
cd $rpostdir
 
# first, create a post/update
 
filedate=$(date +%m%d%y%H%M%S)
 
# if you did not enter text for update, the script asks for it
 
if [[ $(echo $*) ]]; then
	ud="$*"
	title="posted with reddi.sh"
else
	$editor $filedate.rpost
	ud=$(cat $filedate.rpost)
	read -p "enter a title: " title
fi
let fx=pp=0
# to which channel are we posting?
read -p "which channel? " chan
read -p "Category/ies? (comma separated) " cats
read -p "Will we be crossposting?  (y/n) " xpo
if [[ $xpo == "y" ]]; then
     # crosspost to friendica?
          read -p "xpost to friendica? (y/n) " fxq
     if [[ $fxq == "y" ]]; then
     	fx=1
     fi
     read -p "xpost to diaspora? (y/n) " dia
     if [[ $dia = "y" ]]; then
	     dp=1
     fi 
     read -p "xpost to pumpio? (y/n) " ppx
     if [[ $ppx == "y" ]]; then
     	pp=1
     fi
     read -p "xpost to wordpress? (y/n) " wpp
     if [[ $wpp == "y" ]]; then
     	wp=1
     fi
     read -p "xpost to livejournal? (y/n) " ljp
     if [[ $ljp == "y" ]]; then
     	lj=1
     fi
     read -p "xpost to insanejournal? (y/n) " ijp
     if [[ $ijp == "y" ]]; then
     	ij=1
     fi
     read -p "xpost to dreamwidth? (y/n) " dwp
     if [[ $dwp == "y" ]]; then
     	dw=1
     fi
     read -p "xpost to libertree? (y/n) " ltp
     if [[ $ltp == "y" ]]; then
     	lt=1
     fi
     read -p "xpost to statusnet? (y/n) " snp
     if [[ $snp == "y" ]]; then
     	sn=1
     fi
else	
     let fx=pp=wp=ij=lj=dw=lt=sn=dp=0
fi

# and this is the curl command that sends the update to the server
 
if [[ $(curl --ssl -u $user:$pass -d "status=$ud&title=$title&category=$cats&channel=$chan&rtof_enable=$fx&pumpio_enable=$pp&ljpost_enable=$lj&ijpost_enable=$ij&dwpost_enable=$dw&wppost_enable=$wp&libertree_enable=$lt&diaspora_enable=$dp&statusnet_enable=$sn&app=reddi.sh" $rurl/api/statuses/update.xml | grep error) ]]; then
 
# what does the server say?
 
	echo "Error"
else 
	echo "Success!"
	echo $ud
        read -p "Shall we have a look in your browser now? (y/n): " op
 
        if [ $op = "y" ]; then
	     $browser $rurl/channel/$chan
        fi
 
fi
exit

