createAlias() {
echo "#Faire  ' .. ' au lieu de cd .."
echo "alias ..='cd ..'"
echo ""
echo "#Pour ouvrir le dossier html raccourci tape www"
echo "alias www='cd /var/www/html/'"
echo ""
echo "#gs pour git status"
echo "alias gs='git status'"
echo ""
echo "#reload-term pour le reload du term"
echo "alias reload-term='. ~/.bashrc'"
echo " "
echo "#pour ouvrir le fichier de perso du term"
echo "alias edit-term='code ~/.bash_aliases'"
echo ""
echo "#ls -al pour voir les fichiers et dossiers"
echo "alias ll='ls --human-readable -S  -Al --time-style=\"+%H:%M:%S %d-%m-%Y\" --color=always'"
echo ""
echo "#Effacer l'ecran du terminal"
echo "alias cls='clear'"
echo ""
echo "#Affiche les règles du firewall ufw"
echo "alias fire='sudo ufw status numbered'"
echo ""
echo "#Tchou tchou tchou"
echo "alias sl='sl -e'"
} >alias.txt

createAlias
mv alias.txt ~/.bash_aliases
. ~/.bashrc