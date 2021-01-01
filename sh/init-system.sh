#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

echo "Enter one of ['vim', 'i3']"

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo priveledge to run this script."

read input

HOME_FOLDER="$(eval echo ~"$SUDO_USER")"

function log_message {
  if  command -v cowsay &>/dev/null; then
    cowsay $1
  else
    echo $1
  fi
}

function install_dependency {
  log_message "--- Installing dependency: $1"
  sudo apt -y install $1
}

function bind_symlink {
  ln -sfn $1 $2
}

if [[ $input == "i3" ]]; then
  sudo apt update
  install_dependency curl
  install_dependency "i3-wm"
  install_dependency "tty-clock"
  install_dependency "silversearcher-ag"
  install_dependency i3status
  install_dependency compton
  install_dependency xbacklight
  install_dependency feh
  install_dependency cowsay
  install_dependency dmenu
  install_dependency sxiv
  install_dependency tmux
  install_dependency scrot
  install_dependency cmatrix
  install_dependency dunst

  # bind symlinks
  bind_symlink $HOME_FOLDER/.config/tmux/.tmux.conf $HOME_FOLDER
  bind_symlink $HOME_FOLDER/.config/.Xresources $HOME_FOLDER
  bind_symlink $HOME_FOLDER/.config/.Xdefaults $HOME_FOLDER
  bind_symlink $HOME_FOLDER/.config/.xinitrc $HOME_FOLDER
  bind_symlink $HOME_FOLDER/.config/.bash_aliases $HOME_FOLDER
  bind_symlink $HOME_FOLDER/.config/_assets/bg.png $HOME_FOLDER/Pictures/

  mkdir -p $HOME_FOLDER/.fonts/Font-Awesome
  bind_symlink $HOME_FOLDER/.config/_assets/Font-Awesome $HOME_FOLDER/.fonts/Font-Awesome

  if [[ ! -f /etc/X11/xorg.conf ]]; then
    bind_symlink $HOME_FOLDER/.config/_assets/xorg.conf /etc/X11/
  fi

  log_message "i3-wm, tmux and sxiv was installed"

elif [[ $input == "vim" ]]; then
  sudo add-apt-repository ppa:lazygit-team/release -y
  sudo apt update

  install_dependency neovim
  install_dependency vifm
  install_dependency xclip
  install_dependency lazygit
  install_dependency silversearcher-ag

  # install VimPlug
  sudo -u $SUDO_USER bash -c "curl -fLo $HOME_FOLDER/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

  log_message "nvim, lazygit, and vifm installed"

else
  echo "Nothing was installed!"
  log_message "Bye!"
fi

