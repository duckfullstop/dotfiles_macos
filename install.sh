# Install Homebrew
[ $(command -v brew) == "" ] && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install zsh from Homebrew if it hasn't been already (macOS one is OLD)
[ ! -e /usr/local/bin/zsh ] && brew install zsh zsh-completions

# Install oh-my-zsh
[ ! -e ~/.oh-my-zsh ] && git clone --depth 1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && chmod +x ~/.oh-my-zsh/oh-my-zsh.sh

# Tap Homebrew Cask
brew tap caskroom/cask

# Install IDEs
brew cask install goland pycharm

# Install Development Stuff
brew cask install hex-fiend keka wireshark sourcetree

# Install Task Management
brew install task tasksh

# Install Virt / Container Stuff
brew cask install vmware-fusion docker
brew install kubectl kubeadm

# Install Media Stuff
brew cask install iina # Media player
brew cask install spotify swinsian

# Install Chat Programs
brew cask install discord quassel-client

# Install Password Management
brew cask install macpass

# Install Plex Media Player
brew cask install plex-media-player

# Install File Transfer Stuff
brew cask install transmit cyberduck

# Link git config
ln -sf .zshscripts/gitconfig ../.gitconfig

# Link .zshrc
ln -sf .zshscripts/zshrc ../.zshrc

# Link .taskrc
ln -sf .zshscripts/taskrc ../.taskrc

# Link gpg-agent.conf
mkdir -p ~/.gnupg
ln -sf ../.zshscripts/gpg-agent.conf ../.gnupg/gpg-agent.conf

# Change current shell to zsh
shell_path="$(brew --prefix)/bin/zsh"
if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
 sudo bash -c "echo $shell_path >> /etc/shells"
fi
[ $SHELL != $shell_path ] && chsh -s "$shell_path"
