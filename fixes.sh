
#--- CREATING /root/.my.conf ---------------------------------------------------------------
cd /root
touch .my.cnf
cat > .my.cnf <<"EOF"
[client]
user=root
password=root
[mysql]
user=root
password=root
[mysqldump]
user=root
password=root
[mysqldiff]
user=root
password=root
EOF
#------------------------------------------------------------------------------------------



# installing datadog
sudo -u edxapp /edx/bin/pip.edxapp install datadog
sudo pip install datadog

# REMOVE VENVS MAKE EDX STOP WORKING
# Rebuild venvs 

#--- TEMP: restauring repository version of edx | Workaround ----------------------
sudo git -C /edx/app/edxapp/.rbenv  reset --hard
sudo git -C /edx/app/edxapp/edx-platform  reset --hard
sudo git -C /edx/app/insights/edx_analytics_dashboard  reset --hard
sudo git -C /edx/app/analytics_api/analytics_api  reset --hard
sudo git -C /edx/app/certs/certificates  reset --hard
sudo git -C /edx/app/forum/.rbenv  reset --hard
sudo git -C /edx/app/forum/cs_comments_service  reset --hard
sudo git -C /edx/app/forum/.gem/bundler/gems/mongoid-tree-5aa7a4ee16cd  reset --hard
sudo git -C /edx/app/forum/.gem/bundler/gems/delayed_job_mongoid-48b1420d59bc  reset --hard
sudo git -C /edx/app/forum/.gem/bundler/gems/voteable_mongo-538e86856daa  reset --hard
sudo git -C /edx/app/forum/.gem/bundler/gems/kaminari-82a38e07db1c  reset --hard
sudo git -C /edx/app/forum/.gem/bundler/gems/rack-contrib-6ff3ca2b2d98  reset --hard
sudo git -C /edx/app/forum/.gem/bundler/gems/mongoid-magic-counter-cache-28bc5e617cab  reset --hard
sudo git -C /edx/app/xqueue/xqueue  reset --hard
sudo git -C /edx/app/notifier/src  reset --hard
sudo git -C /edx/app/notifier/virtualenvs/notifier/src/opaque-keys reset --hard
sudo git -C /edx/app/demo/edx-demo-course  reset --hard
sudo git -C /edx/app/edx_ansible/edx_ansible  reset --hard
sudo git -C /edx/app/edx_notes_api/edx_notes_api  reset --hard
#------------------------------------------------------------------





pip install --upgrade pip
sudo /edx/bin/pip.edxapp install --upgrade pip
sudo /edx/bin/pip.devpi  install --upgrade pip
sudo /edx/bin/pip.xqueue install --upgrade pip









#--- DEVPI SOLUTION ---------------------------------------------------------------
# Starting the whole process as vagrant
# create venv install devpi there
cd /tmp/
virtualenv devpi-26
source devpi-26/bin/activate
pip install devpi-server==2.6.0


# login as devpi.supervisor
sudo -u devpi.supervisor -s
source devpi-26/bin/activate


# since export commants wants to write down something in db index, well copy db and export the copy
cp -r /edx/var/devpi/data /tmp/devpi-data-old


# export
devpi-server --export /tmp/devpi-data-converted --serverdir /tmp/devpi-data-old/


# now switch to actual devpi server version (3.0.2) assuming that you alreasy tried the whole migrate process,
# it recreated devpi venv dir and failed with starting the server
source /edx/app/devpi/venvs/devpi/bin/activate


# purge old-versioned data and recover it from exported earlier
rm -rf /edx/var/devpi/data
devpi-server --import /tmp/devpi-data-converted/ --serverdir /edx/var/devpi/data


# clean up
exit
deactivate
rm -rf devpi-26 devpi-data-old devpi-data-converted
#--------------------------------------------------------------------------------------------------------------------------------------------