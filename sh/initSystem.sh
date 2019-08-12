#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

echo "Enter one of ['docker', 'lazygit', 'nodejs', 'nvm', 'neovim'] or 'all'"

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo priveledge to run this script."

read input

function install_dependency {
  echo "--- Installing dependency: $1"
  sudo apt -y install $1
}

if [ $input == "lazygit" ]; then
  install_dependency lazygit
  echo "Lazygit installed"

elif [ $input == "neovim" ] || [ $input == "vim" ]; then
  install_dependency neovim

elif [ $input == "nodejs" ] || [ $input == "node" ]; then
  echo "installing nodejs.. - To install your own NodeJS version, try nvm option"

  echo "--- Removing any pre-installed NodeJS"
  sudo apt-get -qq remove nodejs

  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  install_dependency nodejs
  echo "NodeJS installed!"

elif [ $input == "nvm" ]; then
  echo "Installing NVM [Node Version Manager]...."

  sudo apt-get update

  sudo apt-get install build-essential libssl-dev

  curl https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

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

elif [ $input == "docker" ]; then
  echo "Installing Docker...."

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

  sudo apt-get update

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
  echo "Bye!"
fi

