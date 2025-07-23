*** Settings ***
Library    OperatingSystem

*** Test Cases ***

Créer_Et_Lire_Un_Fichier_Texte_Invalide
    [Tags]    Invalide
    [Documentation]    Test invalide

    ${chemin}=    Set Variable    rapport.txt
    ${monTexte}=    Set Variable    Ceci est un rapport de test
    Create File    ${chemin}    ${monTexte}
    ${contenu}=    Get File    ${chemin}
    # Erreur volontaire : comparaison avec une valeur incorrecte
    Should Be Equal As Strings    ${contenu}    Ceci est un contenu erroné
    Remove File    ${chemin}


Créer_Et_Lire_Un_Fichier_Texte
    [Tags]    Valide
    [Documentation]    Test valide

    ${chemin}=    Set Variable    rapport.txt
    ${monTexte}=    Set Variable    Ceci est un rapport de test
    Create File    ${chemin}    ${monTexte}
    ${contenu}=    Get File    ${chemin}
    Should Be Equal As Strings    ${contenu}    ${monTexte}
    Remove File    ${chemin}


