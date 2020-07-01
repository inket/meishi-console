#!/bin/bash

git submodule update --init --recursive

brew install jq

cd nature_remo
sudo gem install bundler
sudo bundle install # sudo ruby "I don't wanna be managing ruby versions right now"
cd ..

cp jp.mahdi.meishi-console.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/jp.mahdi.meishi-console.plist
