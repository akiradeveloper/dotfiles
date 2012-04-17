# akiradeveloper's dotfiles

## Motivation
If you are proud of being a programmer at home and in your office, the configurations are done for both environment manually. Even worse, company usually has proxy server to go outside the LAN and forces the labors to change authentifications frequently that causes repeating yourself and having us against DRY philosophy we programmers all have.

I hate it and the hatred motivated me to write automation script fully utilizing the power of eRuby to commonize the configuration between environments.
 
## Installation
First of all, copy ./.zshrc.local to ~/ and configure it all.  

Also, ./configure.rb is a configuration file on copying the files in this repository to your actual environment so if you want to unable some of the copying tasks, comment them out to even protect your original files.

eRuby is required to evaluate these copied files so you need to install erb beforehand where either by apt or by rvm does not matter.
