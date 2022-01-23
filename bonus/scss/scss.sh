echo "Mise en place d'un template SCSS"
#sleep 5

createDirectory(){
mkdir assets
mkdir assets/js
mkdir assets/scss
mkdir assets/scss/components
mkdir assets/scss/layouts
mkdir assets/scss/utils
}


createIndexHtml(){
echo '    <!DOCTYPE html>'
echo '<html lang="fr-FR">'
echo ''
echo '<head>'
echo '    <meta charset="UTF-8">'
echo '    <meta http-equiv="X-UA-Compatible" content="IE=edge">'
echo '    <meta name="viewport" content="width=device-width, initial-scale=1.0">'
echo '    <title>Document</title>'
echo '    <link rel="stylesheet" href="/assets/scss/main.scss">'
echo ''
echo '</head>'
echo ''
echo '<body>'
echo ''
echo '    <!-- Loading main.js -->'
echo  '   <script src="main.js"></script>'
echo ''
echo '</body>'
echo ''
echo '</html>'
} >index.html


createMainJS(){
echo "console.log('%c' + \"main.js loaded\", 'color: #0bf; font-size: 1rem; background-color:#fff');"
echo ""
echo "// Chargement de reset.css dans ma page html"
echo "import 'reset-css';"
} >main.js

createMainSCSS(){
echo "@import" 
echo "'./utils/variables',"
echo "'./utils/mixins',"
echo "'./utils/typo';"
echo ""
} >assets/scss/main.scss


createMixins(){    
echo "@mixin for-screen-small {"
echo "    @media (min-width: \$screen-small) {"
echo "        body {"
echo "            @content;"
echo "        }"
echo "    }"
echo "}"
echo ""
echo "@mixin for-screen-medium {"
echo "    @media (min-width: \$screen-medium) {"
echo "        body {"
echo "            @content;"
echo "        }"
echo "    }"
echo "}"
echo ""
echo "@mixin for-screen-large {"
echo "    @media (min-width: \$screen-large) {"
echo "        body {"
echo "            @content;"
echo "        }"
echo "    }"
echo "}"
} >assets/scss/utils/_mixins.scss


createTypo(){    
echo "//Insert fonts ect here"
} >assets/scss/utils/_typo.scss

createVariables(){
echo "//Colors"
echo ""
echo "\$white: #FFFFFF;"
echo "\$black: #000000;"
echo ""
echo "//Size For MediaQueries"
echo "\$screen-small:0;"
echo "\$screen-medium:500px;"
echo "\$screen-large:800px;"
} >assets/scss/utils/_variables.scss

createDirectory
createMainSCSS
createVariables
createMixins
createTypo
createMainJS
createIndexHtml

npm init -y
npm install
npm install reset-css
parcel index.html
