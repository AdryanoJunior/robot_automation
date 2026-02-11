*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
I navigate to the login page
    [Arguments]    ${URL}=
    Go To    ${URL}

Access the product catalog
    Wait Until Element Is Visible    xpath=//section/div/nav/div/ul/li[2]/a   
    Click Element    xpath=//section/div/nav/div/ul/li[2]/a

I am able to view the products
    ${locationproduct}    Get Location
    Should Be Equal    ${locationproduct}    http://lojaebac.ebaconline.art.br/produtos/

I select a product and choose the size and color
    Click Link    Abominable Hoodie
    Click Element    css=[title=L]
    Click Element    css=[title=Red]

I click the add to cart button
    Wait Until Element Is Visible    class=single_add_to_cart_button
    Click Button    class=single_add_to_cart_button

Success message product added
    [Arguments]    ${SUCCESS_MESSAGE}=
    Wait Until Element Contains    class=woocommerce-message    ${SUCCESS_MESSAGE}

I click the view cart button
    Click Link    Ver carrinho

I can see the shopping cart
    ${locationcart}    Get Location
    Should Be Equal    ${locationcart}    http://lojaebac.ebaconline.art.br/carrinho/

I click the checkout button
    Click Element    class=checkout-button

I can see the checkout
    ${locationcheckout}    Get Location
    Should Be Equal    ${locationcheckout}    http://lojaebac.ebaconline.art.br/checkout/

I fill in the purchase details
    Input Text    id=billing_first_name    Testing
    Input Text    id=billing_last_name    Success 
    Input Text    id=billing_company    QATester   
    Input Text    id=billing_address_1    Rua Software Testing 300
    Input Text    id=billing_address_2    Casa
    Input Text    id=billing_city    São Paulo
    Input Text    id=billing_postcode    01521020  
    Input Text    id=billing_phone    11999999999
    Input Text    id=billing_email    testqa@gmail.com
    Wait Until Element Is Visible    id=payment_method_cod    
    Click Element    id=payment_method_cod
    Sleep    1s
    Wait Until Element Is Visible     id=terms    
    Click Element    id=terms

I click the complete purchase button
    Click Button    id=place_order
    Wait Until Page Contains    Obrigado. Seu pedido foi recebido.