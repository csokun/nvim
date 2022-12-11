#!/bin/bash
ELIXIR_LSP_SRC="$HOME/.elixir-ls"
if [ ! -d "$ELIXIR_LSP_SRC" ]; then
    git clone --depth 1 https://github.com/elixir-lsp/elixir-ls $ELIXIR_LSP_SRC
fi
pushd $ELIXIR_LSP_SRC
git pull
mix clean && mix deps.get && mix compile

ELIXIR_LSP_SERVER_DIR="$HOME/.local/share/nvim/mason/packages/elixir-ls"
mkdir -p $ELIXIR_LSP_SERVER_DIR
mix elixir_ls.release -o $ELIXIR_LSP_SERVER_DIR
popd
