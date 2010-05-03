#!/usr/bin/env bash

# MongoDB OSX Launchctl Item
# Author: Andrei Railean (http://andrei.md)

echo "Installing MongoDB Launchctl Item and Restarting Mongo";

# create directories
sudo mkdir -p /opt/local/var/db/mongodb
sudo mkdir -p /opt/local/var/log/
sudo touch /opt/local/var/log/mongodb.log

# copy PLIST and (re)install it
sudo cp org.mongo.mongod.plist /System/Library/LaunchDaemons/.
sudo chown root:wheel /System/Library/LaunchDaemons/org.mongo.mongod.plist
sudo launchctl stop org.mongo.mongod
sudo launchctl unload /System/Library/LaunchDaemons/org.mongo.mongod.plist
sudo launchctl load /System/Library/LaunchDaemons/org.mongo.mongod.plist
sudo launchctl start org.mongo.mongod

echo "FINISHED";