*** Settings ***
Library    OperatingSystem

*** Test Cases ***
Créer_Et_Lire_Un_Fichier_Texte
    # Déclaration du nom du fichier
    ${chemin}=    Set Variable    rapport.txt
    ${monTexte}=    Set Variable    Ceci est un rapport de test

    # Enregistrement des données dans le fichier
    Create File    ${chemin}    ${monTexte}

    # Lecture du contenu du fichier
    ${contenu}=    Get File    ${chemin}

    # Comparaison 
    Should Be Equal As Strings    ${contenu}    ${monTexte}

    # Suppression du fichier
    Remove File    ${chemin}