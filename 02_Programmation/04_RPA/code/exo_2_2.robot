*** Settings ***
Library    OperatingSystem
Library    DatabaseLibrary

*** Variables ***
${DBNAME}    test.db

*** Test Cases ***
Vérifier Fichier Base De Données
    File Should Exist    test.db

Connexion À SQLite
    Connect To Database    sqlite3    ${DBNAME}
    Disconnect From Database