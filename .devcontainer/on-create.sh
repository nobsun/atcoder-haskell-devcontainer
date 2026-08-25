#!/bin/bash

# ghcup
curl -sSf https://get-ghcup.haskell.org | sh && ghcup install hls --set
source $HOME/.ghcup/env
stack install implicit-hie --resolver lts-23.28
pushd . && cd $WORKSPACE_DIR/warming-up && stack install --resolver lts-23.28 && popd

# online-judge-tools
pipx install online-judge-tools --include-deps
pipx inject online-judge-tools setuptools

# atcoder-cli
npm install -g --prefix ~/.local atcoder-cli
