init:
	mkdir -p $(HOME)/.vimbundle
	cd $(HOME)/.vimbundle; git clone https://github.com/Shougo/neobundle.vim.git
	# cd gitflow; git submodule init && git submodule update

resync:
	$(HOME)/jb-dotfiles/bin/dotfiles -C $(HOME)/dotfiles/.dotfilesrc --force --sync

install:
	# cd gitflow; make install
	# cd legit; python setup.py install
	# cd git-extras; make install
