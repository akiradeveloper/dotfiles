# akiradeveloper's dotfiles
Don't Repeat Yourself for your virtue.

## Motivation
If you are proud of being a programmer both at home and in your office, the configurations are done for both environment manually. Even worse, company usually has proxy server to go outside the LAN and forces the labors to change authentifications frequently that causes repeating yourself and having us against DRY philosophy we programmers all have.

I hate it and the hatred motivated me to write this automation script fully utilizing the power of eRuby to commonize the configuration between environments.
 
## Installation
First, do "git clone" this repository onto your home directory so the root path for this tree is $HOME/dotfiles .

Second, copy ./.zshrc.local to ~/ and configure it all.

Also, ./configure.rb is a configuration file on copying the files in this repository to your actual environment so if you want to unable some of the copying tasks, comment them out to even protect your original files. I recommend you to set variable FORCE remained false at first time.

eRuby is required to evaluate these copied template files so you need to install erb in system environment. 

Finally, you run install.sh script and see what is happening. 
