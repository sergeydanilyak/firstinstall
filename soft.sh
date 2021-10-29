#!/bin/bash
echo "UPDATE SYSTEM"
apt update && apt full-upgrade
echo "INSTALL GOOGLE CHROME"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && dpkg -i --force-depends google-chrome-stable_current_amd64.deb
echo "INSTALL SNAP"
apt install SNAP -y
echo "INSTALL VSCODE"
snap install code --classic
echo "INSTALL PROSPECT MAIL"
snap install prospect-mail
echo "INSTALL POSTMAN"
snap install postman
echo "INSTALL LENS"
snap install kontena-lens --classic
echo "INSTALL ROBO3T"
snap install robo3t-snap
echo "INSTALL TELEGRAM"
snap install telegram-desktop
echo "INSTALL ZSH AND SET DEFAULT TO ALL USERS"
apt install zsh -y && sed -i 's/bash/zsh/g' /etc/adduser.conf && sed -i 's/bash/zsh/g' /etc/passwd && curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh && apt install fonts-powerline
git clone https://github.com/Kallahan23/zsh-colorls ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-colorls
git clone https://github.com/chrissicool/zsh-bash ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bash
echo "INSTALL DOCKER AND DOCKER-COMPOSE"
apt-get install ca-certificates curl gnupg lsb-release -y &&  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
apt update && apt install docker-ce docker-ce-cli containerd.io 
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose && ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
