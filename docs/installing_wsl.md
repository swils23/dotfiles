# Completely Uninstalling WSL to Start Fresh

1. Uninstall docker desktop, fork, etc.
2. Unregister distro(s) (should also get all files automatically)
```cmd
wsl --list
wsl --unregister Ubuntu 
```

# Update WSL
```cmd
wsl --update
wsl --set-default-version 2
```

# Install WSL
```cmd
wsl --install
wsl --install -d Ubuntu
```

# (Re)Install Docker Desktop
[Docker Desktop](https://www.docker.com/products/docker-desktop/)


# Install Fork
1. Install Fork (Regular)
2. Install Fork WSL
    - [Fork WSL](https://cdn.fork.dev/prerelease/Fork-2.3.20-WSL.zip)
    - [Discussion](https://github.com/fork-dev/TrackerWin/issues/608)
3. Configure Fork WSL
    - Set git instance to use AppData/Local/Fork/gitInstance/.../git.exe
    - Add shortcut to WSL `cd /usr/local/bin && sudo ln -s /mnt/c/Program\ Files/Fork-2.3.20-WSL/Fork.exe fork`


# Set up 1Password
1. [Instructions](https://developer.1password.com/docs/ssh/integrations/wsl/)
2. Test: `ssh.exe -T git@github.com`


# Fix WSL file permissions
1. `git config core.filemode false`
2. `sudo nano /etc/wsl.conf`
3. Add:
    ```
    [automount]
    options = "metadata"
    ```
4. `wsl --shutdown`


# Install packages
1. UV: `curl -LsSf https://astral.sh/uv/install.sh | sh`
2. Just: `sudo apt install just`
3. Python: `uv python install 3.13 --default --preview`
