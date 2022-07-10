# Neovim Config

## Fonts

```bash
wget -qO FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
mkdir -p ~/.fonts/FiraCode
unzip FiraCode.zip -d ~/.fonts/FiraCode/
fc-cache -f -v
```

## Languages Server

```bash
# install stylua
cargo install stylua && asdf reshim rust

# install bash-language-server
npm i -g bash-language-server && asdf reshim nodejs

# setup GitHub Copilot
:Copilot setup

# C/C++
sudo pacman -S clang

# Python
pip install --upgrade pyright autopep8
```

## Debugger

```bash
# golang
go install github.com/go-delve/delve/cmd/dlv@latest

# Elixir ref. https://github.com/elixir-lsp/elixir-ls#debugger-support
```
