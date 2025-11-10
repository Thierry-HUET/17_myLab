*** Test Cases ***
Test_Saute
    [Tags]    Skip
    [Documentation]    Ce test est volontairement ignoré
    Skip    Ce test est ignoré pour démonstration


Test_Saute_Conditionnel
    [Tags]    Skip    Conditionnel
    [Documentation]    Ce test est sauté si une condition est remplie

    ${condition}=    Evaluate    5 > 3
    Run Keyword If    ${condition}    Skip    Condition remplie : test ignoré
    Log    Ce message ne s'affichera pas si le test est sauté
