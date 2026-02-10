*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/login_keywords.resource   
Test Setup    Open Browser    browser=chrome

Documentation    Complete suite of login functionality

*** Variables ***
${URL}    http://lojaebac.ebaconline.art.br/minha-conta/
${BROWSER}    chrome   
${USERNAME}    admintest@gmail.com
${PASSWORD}    Test123$   


*** Test Cases ***
Successful Login
    I navigate to the login page    ${URL}
    I input correct credentials    ${USERNAME}    ${PASSWORD}
    I click on the login button
    I am able view to the home page
    
Insuccessful Login - No Credentials 
    I navigate to the login page    ${URL}
    I input no credentials
    I click on the login button
    I am able to see the expected error message    Erro: Nome de usuário é obrigatório.

Insuccessful Login - No Username
    I navigate to the login page    ${URL}
    I input only the password    ${PASSWORD}
    I click on the login button
    I am able to see the expected error message     Erro: Nome de usuário é obrigatório.

Insuccessful Login - No Password
    I navigate to the login page    ${URL} 
    I input only the username    ${USERNAME}
    I click on the login button
    I am able to see the expected error message     Erro: O campo da senha está vazio.

Insuccessful Login - Wrong Credentials
     I navigate to the login page    ${URL}
     I imput wrong credentials    testqa@gmail.com    testuser
     I click on the login button 
     I am able to see the expected error message     Endereço de e-mail desconhecido. Verifique novamente ou tente seu nome de usuário.

Insuccessful Login - Email with invalid formatting
    I navigate to the login page    ${URL} 
    I input email with invalid formatting    testuser123    ${PASSWORD}    
    I click on the login button
    I am able to see the expected error message     Erro: O usuário testuser123 não está registrado neste site. Se você não está certo de seu nome de usuário, experimente o endereço de e-mail.