MongoDB OSX Snow Leopard Launchctl Item
===
Configure MongoDB to start when Mac OSX system boots.

Mongo Installation
---
This guide assumes you've installed mongo using MacPorts like so:

    sudo port install mongo

Mongo daemon location is assumed to be **`/opt/local/bin/mongod`**

If you [download mongo](http://www.mongodb.org/display/DOCS/Downloads) directly, you need to copy all files inside the bin directory to /opt/local/bin as root. Once you do that, the rest of this guide will apply to you.

Create the DB directory and a log file
---
    sudo mkdir -p /opt/local/var/db/mongodb
    sudo mkdir -p /opt/local/var/log/
    sudo touch /opt/local/var/log/mongodb.log

These locations were chosen because that is how most of the other stuff like **mysql** and **redis** gets installed.

Install/Reinstall Launchctl Item:
---
    sudo cp org.mongo.mongod.plist /System/Library/LaunchDaemons/.
    sudo chown root:wheel /System/Library/LaunchDaemons/org.mongo.mongod.plist
    sudo launchctl stop org.mongo.mongod
    sudo launchctl unload /System/Library/LaunchDaemons/org.mongo.mongod.plist
    sudo launchctl load /System/Library/LaunchDaemons/org.mongo.mongod.plist
    sudo launchctl start org.mongo.mongod`

Install Script
---
All of the above commands wrapped into an install script for convenience

    ./install.sh

This script is **safe to run** even if mongod is already installed

Configuration
---
If your paths are different, you'll need to manually change both the plist file and install script

Other Info
---
If you would prefer to install a mac StartupItem (instead of Launchctl item) use [mongodb-mac-startup](http://github.com/bratta/mongodb-mac-startup)

Idea for this was borrowed from an [article on "Cupcake With Sprinkles" blog](http://www.cupcakewithsprinkles.com/mongodb-startup-item/)

Tested with Mongo **1.4.2** and Mac 10.6.3 (**Snow Leopard**) on **4 May 2010**