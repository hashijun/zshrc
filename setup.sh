#/bin/bash -eu

cd "$(dirname "$0")"

TARGETS=(
".zshrc"
)

RESOURCES=(
".zshrc"
)

OLD_ZSHRC_DIR="zshrc-old"
CURRENT_TIMESTAMP=`date '+%Y%m%d_%H:%M:%S'`

if [ ! -d $HOME/$OLD_ZSHRC_DIR ]; then
    mkdir $HOME/$OLD_ZSHRC_DIR
fi

for ((i = 0;i < ${#TARGETS[*]}; i++)) {

    if [ -f $HOME/${TARGETS[$i]} -o -d $HOME/${TARGETS[$i]} ]; then
        if [ -L $HOME/${TARGETS[$i]} ]; then
            unlink $HOME/${TARGETS[$i]}
        else
            mv -f $HOME/${TARGETS[$i]} $HOME/$OLD_ZSHRC_DIR/${TARGETS[$i]}.$CURRENT_TIMESTAMP
        fi
    fi

    ln -Fisv "$PWD/${RESOURCES[$i]}" $HOME
}
