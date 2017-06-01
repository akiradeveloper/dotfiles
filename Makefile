init:
	mkdir -p $(HOME)/.vimbundle
	cd $(HOME)/.vimbundle; git clone https://github.com/Shougo/neobundle.vim.git

resync:
	dotfiles -C $(HOME)/dotfiles/.dotfilesrc --force --sync
