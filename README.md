My Dotfiles
===========

This is my personal dotfiles. They are managed using:

- [Ansible][1]: Ansible is the simplest way to automate apps and IT infrastructure.
- [Homebrew][3]: for OS X package management
- [pip][4]: The PyPA recommended tool for installing and managing Python packages.

Installation
------------

1. Install Brew
    ```sh
    # Install build-essential, since it can break stuff way down the line
    sudo apt-get -y install build-essential

    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # DOESN'T WORK ON WSL, see next...
    echo 'export PATH=/opt/homebrew/bin:$PATH' >> ~/.zshrc && . ~/.zshrc

    # WSL PATH
    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zshrc


    ```

4. Install all the things
    ```sh
    # Install Brew Formulas
    for app in uv zsh ansible; do
           brew install $app;
       done

    # Install Python
    uv python install 3.13 --default --preview

    # Clone dotfiles
    git clone https://github.com/swils23/dotfiles.git .dotfiles
    cd ~/.dotfiles && make install
    ```

6. Change your default shell

        sudo dscl . -create /Users/$USER UserShell /opt/homebrew/bin/zsh \
        && chsh -s /opt/homebrew/bin/zsh && . ~/.zshrc

7. Change your font for iTerm2 to one of the Powerline fonts like, "Roboto Mono Medium for Powerline."

8. Apps I install manually.

   - [Docker](https://www.docker.com/products/docker-desktop)
   - [Irvue](https://apps.apple.com/us/app/irvue/id1039633667?mt=12)
   - [Microsoft Office](https://www.office.com/)
   - [Elgato Control Center](https://www.elgato.com/en/downloads)
   - [Elgato Wave Link](https://www.elgato.com/en/downloads)
   - [Logitech Options](https://www.logitech.com/en-us/product/options)
   - [AppPack](https://docs.apppack.io/how-to/install/)

9. Settings I change.

   - Increase mouse speed to 9
   - Trackpad: tap to click

 10. Archive and transfer the following folders:
     - ~/Sites
     - ~/.aws
     - ~/Downloads
     - ~/.ssh

     ```
     # Create the archive
     $ tar czvf backup.tar.gz ~/Sites/ ~/.aws ~/Downloads ~/.ssh

     # Transfer the archive to the new computer using AirDrop or SCP
     
     # Extract archive and then move the files to correct locations
     $ tar xzvf backup.tar.gz
     ```

11. Export Sequel Ace connections and copy them to the new computer.

12. Export and Import Raycast settings. 

13. Create a new AWS access key to add to aws-vault.

Inspiration
-----------

- https://github.com/jefftriplett/dotfiles


[1]: http://docs.ansible.com/ansible/
[3]: http://brew.sh/
[4]: https://pip.pypa.io/en/latest/
