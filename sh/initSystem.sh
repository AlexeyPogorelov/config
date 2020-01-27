#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

sudo apt update
clear

echo "Enter one of ['docker', 'nvm', 'vim', 'i3']"

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo priveledge to run this script."

read input

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

if [[ $input == "i3" ]]; then
  install_dependency cowsay
  install_dependency "i3-wm"
  install_dependency sxiv
  install_dependency tmux
  ln -s ~/.config/tmux/.tmux.conf ~
  ln -s ~/.config/.Xresources ~
  ln -s ~/.config/.xinitrc ~

  log_message "i3-wm, tmux and sxiv was installed"

elif [[ $input == "vim" ]]; then
  install_dependency neovim
  install_dependency vifm
  install_dependency lazygit
  # install VimPlug
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  log_message "nvim, lazygit, and vifm installed"

elif [[ $input == "nvm" ]]; then
  echo "Installing NVM [Node Version Manager]...."

  sudo apt-get install build-essential libssl-dev

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

  . ~/.nvm/nvm.sh
  . ~/.profile
  . ~/.bashrc

  nvm --version

  echo "Installing NVM [Node Version Manager] was successful!"

  read -r -p "Please specify the NodeJS version that you want to use - " nodejsversion
  nodejsversion="${nodejsversion}"

  echo "Installing NodeJS version - $nodejsversion"
  nvm install $nodejsversion

  echo "Your NodeJS version has been converted into - $nodejsversion"
  echo "Run 'nvm ls' to see NodeJS version installed!"
  echo "Run 'nvm use {nodejsverison}' to run a specified NodeJS version from the NodeJS installed list"

elif [[ $input == "docker" ]]; then
  echo "Installing Docker...."

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

  echo "Making sure the Docker is installed from Official Docker repo to get the latest version"
  dockerInstallLoc="$(apt-cache policy docker-ce)"
  echo "${dockerInstallLoc}"

  sudo apt-get install -y docker-ce

  dockerSuccess="$(sudo systemctl status docker)"
  echo "${dockerSuccess}"

  echo "Successfully installed Docker!"

  read -r -p "Do you want to add root privileges to run Docker? [Y/n]" response
  response="${response,,}"

  if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
      echo "Adding your username into Docker group"
      sudo usermod -aG docker ${USER}
      su - ${USER}
      echo "Addition of Username to Docker group is successful!"
  else
      echo "Exited without adding root privileges to run Docker"
  fi

  echo "Docker is ready to be used"

else
  echo "Nothing was installed!"
  log_message "Bye!"
fi

