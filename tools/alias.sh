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