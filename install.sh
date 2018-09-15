# Install Homebrew
[ $(command -v brew) == "" ] && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install zsh from Homebrew if it hasn't been already (macOS one is OLD)
[ ! -e /usr/local/bin/zsh ] && brew install zsh zsh-completions

# Install oh-my-zsh
[ ! -e ~/.oh-my-zsh ] && git clone --depth 1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && chmod +x ~/.oh-my-zsh/oh-my-zsh.sh


# Install Brew packages
brew bundle install

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
