*** Settings ***
Library    OperatingSystem

*** Test Cases ***
Créer_Et_Lire_Un_Fichier_Texte
    ${chemin}=    Set Variable    rapport.txt
    Create File    ${chemin}    Ceci est un rapport de test
    ${contenu}=    Get File    ${chemin}
    Should Be Equal As Strings    ${contenu}    Ceci est un rapport de test
    Remove File    ${chemin}