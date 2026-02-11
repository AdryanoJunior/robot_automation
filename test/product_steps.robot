*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/product_keywords.robot
Test Setup    Open Browser    browser=chrome

Documentation    Complete suite of product functionalities

*** Variables ***
${URL}    http://lojaebac.ebaconline.art.br/minha-conta/
${BROWSER}    chrome   
${USERNAME}    admintest@gmail.com
${PASSWORD}    Test123$   

*** Test Cases ***
Order completed successfully
    I navigate to the login page    ${URL}
    Access the product catalog
    I am able to view the products
    I select a product and choose the size and color
    I click the add to cart button
    Success message product added    “Abominable Hoodie” foi adicionado no seu carrinho.
    I click the view cart button
    I can see the shopping cart
    I click the checkout button
    I can see the checkout
    I fill in the purchase details
    I click the complete purchase button
    
     