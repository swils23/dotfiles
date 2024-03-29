Install required packages
```sh
cd ~ && \
sudo apt-get update && sudo apt-get upgrade -y && \
sudo apt-get install -y gcc make git curl ansible build-essential zsh
```

Install Homebrew and add to PATH
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/sam/.bashrc && \
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

Install Python
```sh
brew install python && . ~/.zshrc && which pip3 && pip3 install --upgrade pip
```

Clone dotfiles and install using Ansible
```sh
git clone https://github.com/swils23/dotfiles.git .dotfiles \
&& cd ~/.dotfiles && make install
```

Set zsh as default shell
```sh
echo "/usr/bin/zsh" | sudo tee -a /etc/shells && \
chsh -s /usr/bin/zsh
```