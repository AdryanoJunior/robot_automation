*** Settings ***
Library    SeleniumLibrary
Variables    ../variables/variables.py


*** Keywords ***
I navigate to the login page
    [Arguments]    ${URL}
    Go To    ${URL}

I input correct credentials
    Wait Until Element Is Visible    id=username
    Maximize Browser Window
    Input Text    id=username    ${LOGIN_DATA["correctData"]["username"]} 
    Input Password    id=password    ${LOGIN_DATA["correctData"]["password"]} 

I imput wrong credentials   
     Wait Until Element Is Visible    name=username
     Maximize Browser Window
     Input Text    id=username    ${LOGIN_DATA["wrongData"]["username"]}
     Input Password    id=password    ${LOGIN_DATA["wrongData"]["password"]}

I click on the login button
    Click Button    class=button

I am able view to the home page
    Wait Until Page Contains    Welcome admintest !

I input only the username
    Wait Until Element Is Visible    name=username
    Input Text    id=username    ${LOGIN_DATA["correctData"]["username"]} 

I input only the password
    Wait Until Element Is Visible    name=username
    Input Password    id=password    ${LOGIN_DATA["correctData"]["password"]} 

I input no credentials
    Wait Until Element Is Visible    name=username

I input email with invalid formatting    
    Wait Until Element Is Visible    name=username
    Input Text    id=username    ${LOGIN_DATA["wrongData"]["username"]}
    Input Password    id=password    ${LOGIN_DATA["wrongData"]["password"]} 

I am able to see the expected error message for no credentials
    Wait Until Element Contains    class=woocommerce-error    ${ERROR_MESSAGES["noCredentials"]}

I am able to see the expected error message for no username
    Wait Until Element Contains    class=woocommerce-error    ${ERROR_MESSAGES["noUsername"]}

I am able to see the expected error message for no password
    Wait Until Element Contains    class=woocommerce-error    ${ERROR_MESSAGES["noPassword"]}

I am able to see the expected error message for wrong credentials
    Wait Until Element Contains    class=woocommerce-error    ${ERROR_MESSAGES["wrongCredentials"]}

I am able to see the expected error message for email invalid
    Wait Until Element Contains    class=woocommerce-error    ${ERROR_MESSAGES["emailInvalid"]}
