#!/bin/bash

function delete() {
    echo "Deleting $2 config"
    rm -rf $1
    echo "$2 config successfully deleted!"
}

function install() {
    echo "Installing new $3 config"
    echo $1 "-> "$2
    ln $1 $2
    echo "$3 config successfully installed!"
}

function deleting() {
    delete ~/.config/i3/config i3config
    delete ~/.config/neofetch/config.conf neofetch
    delete ~/.emacs emacs
    delete ~/.config/Code/$USER/settings.json vscode
    delete ~/.gemrc .gemrc
    delete ~/.vimrc .vimrc
    delete ~/.bashrc .bashrc
    delete ~/.zshrc .zshrc
    delete ~/.Xresources .Xresources
}

function installing() {
    install ~/dotfiles/config/i3/config ~/.config/i3/config i3config
    install ~/dotfiles/config/neofetch ~/.config/neofetch/config.conf neofetch
    install ~/dotfiles/emacs/.emacs ~/.emacs emacs
    install ~/dotfiles/vscode/vscode.json ~/.config/Code/$USER/vscode.json vscode
    install ~/dotfiles/home/.gemrc ~/.gemrc .gemrc
    install ~/dotfiles/vim/.vimrc ~/.vimrc .vimrc
    install ~/dotfiles/home/.bashrc ~/.bashrc .bashrc
    install ~/dotfiles/home/.zshrc ~/.zshrc .zshrc
    install ~/dotfiles/home/.Xresources ~/.Xresources .Xresources
}

function default() {
    echo "Deleting old configs"
    deleting
    echo "Installing new configs"
    installing
    echo "Done!"
}

function custom() {
    # TODO: implement
}

function minimal() {
    install ~/dotfiles/home/.zshrc ~/.zshrc zshrc
    install ~/dotfiles/vim/.vimrc ~/.vimrc vimrc
}

function backup() {
    # TODO: implement
}

echo "Dotfiles install wizard"
echo "__________________________"
echo "Pick what you want to do:"
echo "[1] Default install"
echo "[2] Custom install"
echo "[3] Minimal install"
echo "[4] Delete all old configs"
echo "[5] Make backup"
echo "[0] Exit"
read -p "By default - 1: " input

if [[ $input == 1 || $input == "" ]]; then
    default
elif [ $input == 2 ]; then
    custom
elif [ $input == 3 ]; then
    minimal
elif [ $input == 4 ]; then
    deleting
elif [ $input == 5 ]; then 
    backup
elif [ $input == 0 ]; then
    echo "Goodbye, $USER."
else
    echo "Oops, something went wrong, try again"
fi