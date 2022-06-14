# Neovim Config

## Fonts

```bash
wget -qO FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
mkdir -p ~/.fonts/FiraCode
unzip FiraCode.zip -d ~/.fonts/FiraCode/
fc-cache -f -v
```

## Dependencies

```bash
# install stylua
cargo install stylua

# install bash-language-server
npm i -g bash-language-server

# setup GitHub Copilot
:Copilot setup
```

