#wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#php wp-cli.phar --info
#chmod +x wp-cli.phar
#sudo mv wp-cli.phar /usr/local/bin/wp

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp