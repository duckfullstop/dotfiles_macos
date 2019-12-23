# Install Homebrew
[ $(command -v brew) == "" ] && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install zsh from Homebrew if it hasn't been already (macOS one is OLD)
[ ! -e /usr/local/bin/zsh ] && brew install zsh zsh-completions

# Install oh-my-zsh
[ ! -e ~/.oh-my-zsh ] && git clone --depth 1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && chmod +x ~/.oh-my-zsh/oh-my-zsh.sh


# Install Brew packages
brew bundle install

# Link git config
ln -sf ../.dotfiles/gitconfig ../.gitconfig

# Link .zshrc
ln -sf ../.dotfiles/zshrc ../.zshrc

# Link .taskrc
ln -sf ../.dotfiles/taskrc ../.taskrc

# Link OpenSC to a defined place so that the SSH config for pkcs11 can find it properly (annoyingly this requires sudo)
sudo ln `brew list opensc | grep lib/opensc-pkcs11.so` /usr/local/lib/opensc-pkcs11.so

# Link SSH config
mkdir -p ../.ssh
ln -sf ../.dotfiles/ssh_config ../.ssh/config

# Link gpg stuff
mkdir -p ~/.gnupg
ln -sf ../.dotfiles/gpg-agent.conf ../.gnupg/gpg-agent.conf
ln -sf ../.dotfiles/scdaemon.conf ../.gnupg/scdaemon.conf

# Change current shell to zsh
shell_path="$(brew --prefix)/bin/zsh"
if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
 sudo bash -c "echo $shell_path >> /etc/shells"
fi
[ $SHELL != $shell_path ] && chsh -s "$shell_path"
