#/bin/bash -eu

cd "$(dirname "$0")"

ZSHRC=".zshrc"
OLD_ZSHRC_DIR="zshrc-old"
CURRENT_TIMESTAMP=`date '+%Y%m%d_%H:%M:%S'`

if [ ! -d $HOME/$OLD_ZSHRC_DIR ]; then
    mkdir $HOME/$OLD_ZSHRC_DIR
fi


if [ -f $HOME/$ZSHRC -o -d $HOME/$ZSHRC ]; then
    if [ -L $HOME/$ZSHRC ]; then
        unlink $HOME/$ZSHRC
    else
        mv -f $HOME/$ZSHRC $HOME/$OLD_ZSHRC_DIR/$ZSHRC.$CURRENT_TIMESTAMP
    fi
fi

ln -Fisv "$PWD/$ZSHRC" $HOME
