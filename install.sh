#!/bin/sh

ruby install/user.rb
sudo -E ruby install/system.rb
git submodule update --init
