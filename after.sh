#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.


# install unzip for aws zip folder
sudo apt-get install unzip
# download and setup aws so the AWS services and CLI commands work right out the bat
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# set up aliases shortcut for specific laravel folder
# note for futute: figure out how to add aliases file so that the shortcuts are recognised global$
# for now this will do

#echo "alias pa='php artisan'" >> /home/vagrant/ClashTarget/aliases
#. /home/vagrant/ClashTarget/aliases

# set up cron job for laravel
line="* * * * * php ~/ClashTarget/artisan schedule:run 1>> /dev/null 2>&1"
(crontab -u vagrant -l; echo "$line" ) | crontab -u vagrant -

#install APIDOCJS
sudo sudo npm install apidoc -g

echo "#######################";
echo "HOMESTEAD is NOW READY.";
echo "#######################";


