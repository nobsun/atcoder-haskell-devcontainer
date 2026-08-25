#!/bin/bash

if [ ! -d $HOME/.stack/templates ]; then
    mkdir -p $HOME/.stack/templates
fi

cp $WORKSPACE_DIR/.devcontainer/stack-conf/templates/atcoder.hsfiles $HOME/.stack/templates/

cp $WORKSPACE_DIR/.devcontainer/stack-conf/config.yaml $HOME/.stack/config.yaml

if [ ! -d $HOME/.config/atcoder-cli-nodejs ]; then
    mkdir -p $HOME/.config/atcoder-cli-nodejs
    cp -r $WORKSPACE_DIR/.devcontainer/acc-conf/* $HOME/.config/atcoder-cli-nodejs/
fi

if [ ! -d $HOME/.local/share/online-judge-tools ]; then
    mkdir -p $HOME/.local/share/online-judge-tools
fi

if [ ! -d $HOME/.local/bin ]; then
    mkdir -p $HOME/.local/bin
fi

cat > $HOME/.local/bin/atcoder-new <<EOF
#!/bin/bash

stack new \$1 $HOME/.stack/templates/atcoder.hsfiles

EOF

chmod +x $HOME/.local/bin/atcoder-new

pipx install aclogin
pipx ensurepath

echo $ATCODER_REVEL_SESSION | $HOME/.local/bin/aclogin

if [ ! -d $WORKSPACE_DIR/AtCoder ]; then
    mkdir -p $WORKSPACE_DIR/AtCoder
fi
