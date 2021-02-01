# Create symlinks
ls -s ~/.dotfiles/.zshrc ~/.zshrc
ls -s ~/.dotfiles/.gitconfig ~/.gitconfig
ls -s ~/.dotfiles/.vuerc ~/.vuerc
ls -s ~/.dotfiles/.bashrc ~/.bashrc
ls -s ~/.dotfiles/.vimrc ~/.vimrc

mkdir -p ~/.vim/autoload

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install NodeJS
curl -o- curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | zsh
nvm install --lts
nvm use --lts
