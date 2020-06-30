#!/bin/bash

git submodule update --init --recursive

cd nature_remo
sudo bundle install # sudo ruby "I don't wanna be managing ruby versions right now"
cd ..

cp jp.mahdi.meishi-console.plist ~/Library/LaunchAgents/
launchctl load jp.mahdi.meishi-console
