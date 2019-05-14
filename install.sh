#!/bin/bash

function delete() {
    echo "Deleting $2 config"
    rm -rf $1
    echo "$2 config successfully deleted!"
}

function install() {
    echo "Installing" $1 "-> "$2
    ln $1 $2
    echo "$3 config successfully installed!"
}

function copy() {
    echo "Copying $2 -> /home/$USER/backup/ folder."
    cp $1 /home/$USER/backup/
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

function backup() {
    echo "Making backup"
    if [ ! -d /home/$USER/backup ]; then
        mkdir -p /home/$USER/backup
    fi

    copy ~/.config/i3/config i3config
    copy ~/.config/neofetch/config.conf neofetch
    copy ~/.emacs emacs
    copy ~/.config/Code/$USER/vscode.json vscode
    copy ~/.gemrc .gemrc
    copy ~/.vimrc .vimrc
    copy ~/.bashrc .bashrc
    copy ~/.zshrc .zshrc
    copy ~/.Xresources .Xresources
}

function default() {
    echo "Deleting old configs"
    deleting
    echo "Installing new configs"
    installing
    echo "Done!"
}

function custom() {
    echo "This option not available yet"
    # TODO: implement
}

function minimal() {
    delete ~/.bashrc .bashrc
    install ~/dotfiles/home/.bashrc ~/.bashrc .bashrc
    delete ~/.vimrc .vimrc
    install ~/dotfiles/vim/.vimrc ~/.vimrc vimrc
}

function init() {
    if [[ $1 == "-d" || $1 == "--default" ]]; then
        backup
        default
    elif [[ $1 == "-c" || $1 == "--custom" ]]; then
        custom
    elif [[ $1 == "-m" || $1 == "--minimal" ]]; then
        minimal
    elif [[ $1 == "-r" || $1 == "--remove" ]]; then
        deleting
    elif [[ $1 == "-b" || $1 == "--backup" ]]; then
        backup
    else
        main
    fi
}

function main() {
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
}

init $1