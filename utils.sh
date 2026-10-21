show_menu() {
    clear
    echo "=============================="
    echo "        MENU UTILS"
    echo "=============================="
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "       Frontend Angular       "
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "------------------------------"
    echo " 1) Lancer le front en mode dev"
    echo " 2) Lancer le front en mode production"
    echo " 3) Generer un composant Angular"
    echo " 4) Generer un service Angular"
    echo " 5) Generer un modele Angular"
    echo " 6) Generer une page Angular"
    echo " 7) Generer un enum Angular"
    echo "------------------------------"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "          GIT Commands        "
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "------------------------------"
    echo " 31) Tirer les dernières modifications"
    echo " 32) Pousser les modifications locales"
    echo "------------------------------"
    echo " 0) Quitter"
    echo "=============================="
    echo -n "Votre choix : "
}
generate_component_angular() {
    echo -n "Entrez le nom du composant Angular à générer : "
    read component_name
    cd frontend && ng generate component components/"$component_name" && cd ..
    echo "Composant '$component_name' généré avec succès."
    echo "Appuyez sur une touche pour continuer..."
    read -n 1
}
generate_page_angular() {
    echo -n "Entrez le nom de la page Angular à générer : "
    read page_name
    cd frontend && ng generate component pages/"$page_name" && cd ..
    echo "Page '$page_name' générée avec succès."
    echo "Appuyez sur une touche pour continuer..."
    read -n 1
}
generate_service_angular() {
    echo -n "Entrez le nom du service Angular à générer : "
    read service_name
    cd frontend && ng generate service services/"$service_name"/"$service_name" && cd ..
    echo "Service '$service_name' généré avec succès."
    echo "Appuyez sur une touche pour continuer..."
    read -n 1
}
generate_model_angular() {
    echo -n "Entrez le nom du modèle Angular à générer : "
    read model_name
    cd frontend && ng generate interface models/"$model_name"/"$model_name" && cd ..
    echo "Modèle '$model_name' généré avec succès."
    echo "Appuyez sur une touche pour continuer..."
    read -n 1
}
generate_enum_angular() {
    echo -n "Entrez le nom de l'énum Angular à générer : "
    read enum_name
    cd frontend && ng generate enum enums/"$enum_name"/"$enum_name" && cd ..
    echo "Énumération '$enum_name' générée avec succès."
    echo "Appuyez sur une touche pour continuer..."
    read -n 1
}
git_pull() {
    git pull origin $(git branch --show-current)
    echo "Mises à jour tirées avec succès."
    echo "Appuyez sur une touche pour continuer..."
    read -n 1
}
git_push() {
    echo -n "Entrez le message de commit : "
    read commit_message
    git add .
    git commit -m "$commit_message"
    git push origin $(git branch --show-current)
    echo "Modifications poussées avec succès."
    echo "Appuyez sur une touche pour continuer..."
    read -n 1
}
while true; do
    show_menu
    read choice

    case "$choice" in
        1)
            cd frontend && ng build --configuration=development && ng serve --configuration=development && cd ..
            ;;
        2)
            cd frontend && ng build --configuration=production && ng serve --configuration=production && cd ..
            ;;
        3)
            generate_component_angular
            ;;
        4)
            generate_service_angular
            ;;
        5)
            generate_model_angular
            ;;
        6)
            generate_page_angular
            ;;
        7)
            generate_enum_angular
            ;;
        31)
            git_pull
            ;;
        32)
            git_push
            ;;
        0)
            echo "Au revoir!"
            exit 0
            ;;
    esac
done
