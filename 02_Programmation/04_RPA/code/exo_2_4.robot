*** Settings ***
Library    OperatingSystem
Library    DatabaseLibrary

*** Variables ***
${DBNAME}    test.db
    
*** Test Cases ***
Vérification Des Utilisateurs
    Connect To Database    sqlite    ${DBNAME}
    ${result}=    Query    SELECT nom FROM utilisateurs
    ${noms_attendus}=    Create List    Alice    Charlie
    FOR    ${nom_attendu}    IN    @{noms_attendus}
        ${trouvé}=    Set Variable    False
        FOR    ${row}    IN    @{result}
            ${nom}=    Set Variable    ${row[0]}
            Run Keyword If    '${nom}' == '${nom_attendu}'    Set Variable    ${trouvé}    True
        END
        Should Be True    ${trouvé}    msg=Le nom ${nom_attendu} n’a pas été trouvé dans la base.
    END
    Disconnect From Database