# Neovim Config

## Keymaps

| Key       | Description                |
| --------- | -------------------------- |
| `CTRL+p`  | Telescope find_files       |
| `CTRL+f`  | Telescope live_grep        |
| `CTRL+b`  | Telescope buffers          |
| `SPC+ca`  | Code action                |
| `SPC+rn`  | Rename                     |
| `ALT+g`   | LazyGit                    |
| `TAB`     | Switch buffer (bufferline) |
| `SHIFT+s` | Hop word                   |

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
pip install --upgrade pyright autopep8 && asdf reshim python

pip install beautysh && asdf reshim python
```

## Javascript/Typescript formatting

Eslint_d and Prettierd installation:

```bash
npm i -g eslint_d @fsouza/prettierd
```

Create `.prettierrc.json` with the following config:

```json
{
  "semi": true,
  "singleQuote": true
}
```

Add the following line to `.eslintrc`

```json
  ...
  "rules": {
    "quotes": ["error", "single"],
    "semi": ["error", "always"]
  }
  ...
```

## Debugger

```bash
# golang
go install github.com/go-delve/delve/cmd/dlv@latest

# Elixir ref. https://github.com/elixir-lsp/elixir-ls#debugger-support
```
