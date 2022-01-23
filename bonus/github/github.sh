echo 'Salut,nous allons parametrer ensemble la clé ssh pour github'
sleep 2
read -p "J'ai besoin de ton adresse e-mail : " EMAIL
ssh-keygen -t ed25519 -C "$EMAIL"
echo "Va sur github,à cet emplacement : Settings > SSH and GPG keys > New SSH key "
echo "Copier ceci sur github en tant que nouvelle clé ssh : "
cat ~/.ssh/id_ed25519.pub
read -p "Dit OK quand tu as terminé : " OKBRO

echo "activation de la clé en local"
sleep 2
eval "$(ssh-agent -s)" # pour lancer ssh-agent de façon sécurisée
ssh-add ~/.ssh/id_ed25519 # pour activer la clé SSH

echo "Configuration locale de Git"
sleep 2
read -p "Nom que tu souhaites afficher dans les commit : " GIT_USER_NAME
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$EMAIL"
git config --global core.editor code
git config --global color.ui true


echo "Résumer des reglages Git :"
git config -l