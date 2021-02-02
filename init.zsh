mkdir ~/tempdl

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

# Install Golang
wget https://dl.google.com/go/go1.15.7.linux-amd64.tar.gz -P ~/tempdl
tar -C ~/tempdl -xzf go1.15.7.linux-amd64.tar.gz 
mv ~/tempdl/go /usr/local 
export PATH=$PATH:/usr/local/go/bin

# Install Rustlang
curl https://sh.rustup.rs -sSf | sh -s -- -y --profile complete

rm -rf ~/tempdl
