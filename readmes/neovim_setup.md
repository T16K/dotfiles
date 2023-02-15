# [Neovim](https://wiki.archlinux.org/title/Neovim)

## Setting up

First run `install.sh` and `setup.sh` scripts and then,
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Installing plugins

run `:PlugInstall` to install the plugins.

### Python client to Neovim

run `python3 -m pip install --user --upgrade pynvim`.

## Inkscape

### Figure Manager

First, run `pip3 install inkscape-figures`.

Add the newly created directory to the PATH environment variable by editing your shell profile file:
```
echo 'export PATH=$PATH:~/.local/bin' >> ~/.zshrc
source ~/.zshrc
```

Then, run `inkscape-figures watch` in a terminal to setup the file watcher.
