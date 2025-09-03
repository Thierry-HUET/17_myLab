*** Settings ***
Library    Browser

*** Variables ***
${URL}     https://the-internet.herokuapp.com/login

*** Test Cases ***
Ouverture de la page de login
    New Browser    chromium
    New Page    ${URL}
    Get Text    input[name="username"]
    Get Text    input[name="password"]
    Get Text    button[type="submit"]
    Close Browser

Connexion invalide
    New Browser    chromium
    New Page    ${URL}
    Fill Text    input[name="username"]    fauxuser
    Fill Text    input[name="password"]    fauxpass
    Click    button[type="submit"]
    Get Text    #flash    ==    Your username is invalid!
    Close Browser

Connexion valide
    New Browser    chromium
    New Page    ${URL}
    Fill Text    input[name="username"]    tomsmith
    Fill Text    input[name="password"]    SuperSecretPassword!
    Click    button[type="submit"]
    Wait For URL    */secure
    Get Text    #flash    ==    You logged into a secure area!
    Close Browser
