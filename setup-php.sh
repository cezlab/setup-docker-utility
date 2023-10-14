# Install PHP
sudo apt install software-properties-common zip -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y
sudo apt install --no-install-recommends php8.1 php8.1-cli php8.1-mysql php8.1-bcmath php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-common php8.1-curl php8.1-gd php8.1-imagick php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-xsl php8.1-soap php8.1-zip php8.1-redis php8.1-intl -y 
sudo apt install --no-install-recommends php8.2 php8.2-cli php8.2-mysql php8.2-bcmath php8.2-xml php8.2-xmlrpc php8.2-curl php8.2-common php8.2-curl php8.2-gd php8.2-imagick php8.2-dev php8.2-imap php8.2-mbstring php8.2-opcache php8.2-xsl php8.2-soap php8.2-zip php8.2-redis php8.2-intl -y
# Install Docker
sudo apt install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER

# Configure Docker to start on boot with systemd
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# PHP Composer 
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

composer config -g github-oauth.github.com f89d0c2f63b83f59463dc5d19c8779fa2c40ca6f
composer config -g http-basic.repo.magento.com 3f75d0ce768c304aa5c50feac3c02255 cf23729ec36f056ce11487af881802e5