#Installation d'un outil indispensable
sh ./tools/cow.sh

#Changement du fond d'ecran
sh ./tools/bckgd/bckgd.sh

#Mise a jour des programmes préinstallés
sudo apt update
sudo apt upgrade -y

#Creation des alias
sh ./tools/alias.sh

#Suppression des jeux et appli useless
sh ./tools/remove.sh

#Installation logiciels indispensable
sh ./tools/indi.sh

#Installation AMP (apache2 / MySQL / PHP)
sh ./tools/amp.sh

#Creation d'un raccourci vers www sur le bureau
 cd ~/Bureau
 ln -s /var/www/html/


sudo apt autoclean -y
sudo apt autoremove -y

clear

echo ""
echo "N'oublies pas de relancer le terminal pour beneficier des Aliases fraichement creer ."
echo ""
echo "Tu peux aussi configurer Git avec l'aide de kourou "
echo ""
echo "Dans le dossier docs vous retrouverez vos identifiants de la base de données et la liste des aliases. "
echo ""
echo "https://kourou.oclock.io/ressources/fiche-recap/git-et-github/"

cowsay "Meuh ! ! ! ! ! ! ! ! ! "
