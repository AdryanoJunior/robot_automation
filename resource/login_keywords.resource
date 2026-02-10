*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
I navigate to the login page
    [Arguments]    ${URL}
    Go To    ${URL}

I input correct credentials
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Wait Until Element Is Visible    name=username
    Maximize Browser Window
    Input Text    id=username    ${USERNAME} 
    Input Password    id=password    ${PASSWORD} 

I imput wrong credentials   
    [Arguments]    ${WRONG_USERNAME}    ${WRONG_PASSWORD}
     Wait Until Element Is Visible    name=username
     Maximize Browser Window
     Input Text    id=username    ${WRONG_USERNAME}
     Input Password    id=password    ${WRONG_PASSWORD}

I click on the login button
    Click Button    class=button

I am able view to the home page
    Wait Until Page Contains    Welcome admintest !

I am able to see the expected error message
    [Arguments]    ${ERROR_MESSAGE}=
    Wait Until Element Contains    class=woocommerce-error    ${ERROR_MESSAGE}

I input only the username
    [Arguments]    ${USERNAME}=
    Wait Until Element Is Visible    name=username
    Input Text    id=username    ${USERNAME} 

I input only the password
    [Arguments]    ${PASSWORD}=
    Wait Until Element Is Visible    name=username
    Input Password    id=password    ${PASSWORD} 

I input no credentials
    Wait Until Element Is Visible    name=username

I input email with invalid formatting
    [Arguments]    ${EMAIL_INVALID}=    ${PASSWORD}=    
    Wait Until Element Is Visible    name=username
    Input Text    id=username    ${EMAIL_INVALID}
    Input Password    id=password    ${PASSWORD} 