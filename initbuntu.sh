sudo apt update

#Installation d'un outil indispensable
sudo apt install cowsay
cowsay "Salut jeune dévellopeur ? tu aimes les scripts qui font tout à ta place? j'crois la question elle est vite répondu ! ! ! "
sleep 5
clear

sudo apt upgrade
sudo wget https://az764295.vo.msecnd.net/stable/899d46d82c4c95423fb7e10e68eba52050e30ba3/code_1.63.2-1639562499_amd64.deb
sudo apt install ./code_1.63.2-1639562499_amd64.deb
sudo rm code_1.63.2-1639562499_amd64.deb

# Modification du bckgrd
cd /usr/share/backgrounds/
sudo wget https://i.imgur.com/ZWItHKf.jpeg
sudo mv ZWItHKf.jpeg honeycomb.jpeg
gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/honeycomb.jpeg

#Creation des alias
{
echo "#Faire  \" .. \" au lieu de cd .."
echo "alias ..='cd ..'"
echo ""
echo "#pour ouvrir le dossier html en raccourci tape www"
echo "alias www='cd /var/www/html/'"
echo ""
echo "#gs pour git status"
echo "alias gs='git status'"
echo ""
echo "#ça c'est une connerie"
echo "alias gps=\"echo 'Vous etes ici -->*<--'\""
echo ""
echo "#reload-term pour le reload du term"
echo "alias reload-term='. ~/.bashrc'"
echo ""
echo "#pour ouvrir le fichier de perso du term"
echo "alias edit-term='code ~/.bash_aliases'"
echo ""
echo "#afficher la liste des alias ci-dessus"
echo "alias alias-list='echo .. = cd .."
echo "echo www = cd /var/www/html/"
echo "echo gs = git status"
echo "echo reload-term = . ~/.bashrc"
echo "echo edit-term = code ~/.bash_aliases'"
} >.bash_aliases

mv .bash_aliases ~/.bash_aliases
. ~/.bashrc

#Suppression des jeux et appli useless


sudo apt remove  gnome-mahjongg -y

sudo apt remove  thunderbird -y

sudo apt remove  gnome-mines -y

sudo apt remove  aisleriot -y

sudo apt remove  gnome-sudoku -y


#Install Git
sudo apt install git

#Install tweak tool
#sudo apt install gnome-tweaks -y
#Aller installer ça : https://extensions.gnome.org/extension/1160/dash-to-panel/

#Install Chrome
sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable

#Install VSCode
sudo wget https://az764295.vo.msecnd.net/stable/899d46d82c4c95423fb7e10e68eba52050e30ba3/code_1.63.2-1639562499_amd64.deb
sudo dpkg -i code_1.63.2-1639562499_amd64.deb
sudo rm code_1.63.2-1639562499_amd64.deb


#Install apache2 + php
#https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-20-04
sudo apt-get install apache2 -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo chown -R $USER:www-data /var/www/

#Install Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer


# apache configuration
sudo a2enmod rewrite
sudo php -r "file_put_contents('/etc/apache2/apache2.conf', str_replace('AllowOverride None', 'AllowOverride All', file_get_contents('/etc/apache2/apache2.conf')));"
sudo service apache2 restart


#install MySQL
sudo apt install mysql-server


#Install phpMyAdmin
sudo apt-get install phpmyadmin

#Install zip
sudo apt-get install zip

#Install insomnia
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

# Refresh repository sources and install Insomnia
sudo apt-get update
sudo apt-get install insomnia

#Creation d'un raccourci vers www sur le bureau
 cd ~/Bureau
 ln -s /var/www/html/


sudo apt autoclean
sudo apt autoremove

cowsay "N'oublies pas de relancer le terminal pour beneficier des Aliases fraichement creer .
tu peux aussi configurer Git avec l'aide de kourou 
 Meuh!!!!!!!!!!!!!!!!!!!!"
echo ""
echo https://kourou.oclock.io/ressources/fiche-recap/git-et-github/
