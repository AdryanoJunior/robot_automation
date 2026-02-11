*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/login_keywords.resource   
Test Setup    Open Browser    browser=chrome
Variables    ../variables/variables.py

Documentation    Complete suite of login functionality

*** Variables ***
${URL}    http://lojaebac.ebaconline.art.br/minha-conta/
  
  
*** Test Cases ***
Successful Login
    I navigate to the login page    ${URL}
    I input correct credentials    
    I click on the login button
    I am able view to the home page
    
Insuccessful Login - No Credentials 
    I navigate to the login page    ${URL}
    I input no credentials
    I click on the login button
    I am able to see the expected error message for no credentials   

Insuccessful Login - No Username
    I navigate to the login page    ${URL}
    I input only the password     
    I click on the login button
    I am able to see the expected error message for no username    

Insuccessful Login - No Password
    I navigate to the login page    ${URL} 
    I input only the username    
    I click on the login button
    I am able to see the expected error message for no password

Insuccessful Login - Wrong Credentials
     I navigate to the login page    ${URL}
     I imput wrong credentials    
     I click on the login button 
     I am able to see the expected error message for wrong credentials 

Insuccessful Login - Email with invalid formatting
    I navigate to the login page    ${URL} 
    I input email with invalid formatting      
    I click on the login button
    I am able to see the expected error message for email invalid   