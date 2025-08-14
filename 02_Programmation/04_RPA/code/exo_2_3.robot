*** Settings ***
Library    OperatingSystem
Library    DatabaseLibrary

*** Variables ***
${DBNAME}    test.db

*** Test Cases ***
Vérifier Fichier Base De Données
    File Should Exist    test.db

Ajout De Plusieurs Utilisateurs
    Connect To Database    sqlite3    ${DBNAME}
    @{noms}=    Create List    Alice    Bob    Charlie    Diana
    FOR    ${nom}    IN    @{noms}
        Execute Sql String    INSERT INTO users (nom) VALUES ('${nom}')
    END
    Disconnect From Database