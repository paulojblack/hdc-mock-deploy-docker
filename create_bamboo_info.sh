#!/bin/bash
# Bamboo user, files and directories

# source from pkeys
# echo "" >> /etc/hosts
# end source from pkeys
useradd bamboo
echo "bamboo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/bamboo-user
chmod 440 /etc/sudoers.d/bamboo-user

SSH_KEY_FILE="/home/bamboo/.ssh/id_rsa"
SSH_DEPLOY_KEY_FILE="/home/bamboo/.ssh/deployment_web_rsa"
SSH_DEPLOY_WEBPROD_FILE="/home/bamboo/.ssh/deployment_web_webprod_rsa"
SSH_CONFIG_FILE="/home/bamboo/.ssh/config"
SSH_FOLDER=$(dirname $SSH_KEY_FILE)
mkdir /home/bamboo/
mkdir $SSH_FOLDER
chmod 700 $SSH_FOLDER
touch $SSH_KEY_FILE
chmod 600 $SSH_KEY_FILE
touch $SSH_DEPLOY_KEY_FILE
chmod 600 $SSH_DEPLOY_KEY_FILE
touch $SSH_DEPLOY_WEBPROD_FILE
chmod 600 $SSH_DEPLOY_WEBPROD_FILE
touch $SSH_CONFIG_FILE
chmod 644 $SSH_CONFIG_FILE
ssh-keyscan -H github.com >> $SSH_FOLDER/known_hosts
ssh-keyscan -H github.dominionenterprises.com >> $SSH_FOLDER/known_hosts
ssh-keyscan -H stash.homes.com >> $SSH_FOLDER/known_hosts
chown -R bamboo:bamboo /home/
