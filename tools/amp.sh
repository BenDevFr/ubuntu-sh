installApache() {
    #installation apache==============================
    sudo apt-get install -y apache2
    #activation du mod rewrite pour les htaccess=======
    sudo a2enmod rewrite
    sudo php -r "file_put_contents('/etc/apache2/apache2.conf', str_replace('AllowOverride None', 'AllowOverride All', file_get_contents('/etc/apache2/apache2.conf')));"
    sudo service apache2 restart
}

configureApache() {
    #configuration apache
    sudo php -r "file_put_contents('/etc/apache2/apache2.conf', str_replace('AllowOverride None', 'AllowOverride All', file_get_contents('/etc/apache2/apache2.conf')));"

    #configuration des droits

    #sudo chown -R $USER_NAME:www-data /var/www/html
    #sudo chmod -R 775 /var/www/html
    #sudo chmod g+s /var/www/html
    sudo chown -R $USER:www-data /var/www/
    sudo rm -rf /var/www/html/index.html
    sudo service apache2 restart

}

installPHP() {
    #installation php========================
    #sudo apt-get install -y php
    sudo apt install php libapache2-mod-php php-mysql -y
    sudo apt-get install -y php-zip
    sudo apt-get install -y php-gd
    sudo apt-get install -y php-xml
    sudo apt-get install -y php-simplexml
    sudo apt-get install -y php-sqlite3
    sudo apt-get install -y php-mbstring
    sudo apt-get install -y php-mysql
    sudo apt-get install -y php-pdo
    sudo apt-get install -y php-xdebug
    sudo apt-get install -y php-intl
    sudo apt-get install -y php-curl
    sudo apt-get install -y php-imagick
    #création d'un fichier phpinfo pour vérifier la configuration=========
    sudo echo "<?php phpinfo(); " >/var/www/html/phpinfo.php

    #composer
    #attention c'est une installation bourrine de composer...
    cd /tmp
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php composer-setup.php --quiet
    sudo mv composer.phar /usr/local/bin/composer

    sudo service apache2 restart
}

configurePHP() {
    sudo php -r "\$ini=glob('/etc/php/*/apache2/php.ini')[0]; \$buffer=file_get_contents(\$ini); \$buffer=str_replace('display_errors = Off', 'display_errors = On',\$buffer); file_put_contents(\$ini, \$buffer);"
    sudo service apache2 restart
}

installMySQL() {
    sudo apt install mysql-server

    #installation adminer
    sudo mkdir /var/www/html/adminer
    sudo wget https://github.com/vrana/adminer/releases/download/v4.8.0/adminer-4.8.0.php
    sudo mv adminer-4.8.0.php /var/www/html/adminer/index.php
}

configureMysql() {
    #USER_NAME=$USER
    # BDD_USER_NAME="explorateur"
    # BDD_USER_PASSWORD="explorateur"
    # BDD_REMOTE_HOST="remote_host"
    read -p "BDD Identifiant ? " BDD_USER_NAME
    echo $BDD_USER_NAME
    read -p "BDD password ? " BDD_USER_PASSWORD
    echo $BDD_USER_PASSWORD
    read -p "BDD host ? (Généralement : localhost) " BDD_REMOTE_HOST
    echo $BDD_REMOTE_HOST

    #configuration mysql=====================
    #sudo mysql -e"CREATE USER '$BDD_USER_NAME'@'localhost' IDENTIFIED BY '$BDD_USER_PASSWORD';" mysql
    #sudo mysql -e"GRANT ALL PRIVILEGES ON *.* TO '$BDD_USER_NAME'@'localhost';" mysql
    sudo mysql -e"CREATE USER '$BDD_USER_NAME'@'$BDD_REMOTE_HOST' IDENTIFIED BY '$BDD_USER_PASSWORD';" mysql
    sudo mysql -e"GRANT ALL PRIVILEGES ON * . * TO '$BDD_USER_NAME'@'$BDD_REMOTE_HOST';" mysql
    sudo mysql -e "FLUSH PRIVILEGES;"

    createDbTxt() {
        echo "Rappel de vos infos mysql"
        echo ""
        echo "Host : $BDD_REMOTE_HOST"
        echo "Identifiant : $BDD_USER_NAME"
        echo "Mdp : $BDD_USER_PASSWORD"
    } >./docs/database.txt
    createDbTxt

    #sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
    sudo service mysql restart
}

installApache
configureApache
installPHP
configurePHP
installMySQL
configureMysql
