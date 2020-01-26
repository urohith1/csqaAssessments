*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary
Library           Collections

*** Test Cases ***
GoogleLanValidation
    Open Browser    http://www.google.com    chrome
    Maximize Browser Window
    &{dict_lang}    lang2=Google सर्च    lang1=Google Search    lang3=Google সার্চ    lang4=Google శోధన    lang5=Google शोध    lang6=Google தேடல்
    ...    lang7=Google શોધ    lang8=Google ಹುಡುಕಾಟ    lang9=Google തിരയൽ    lang10=Google ਖੋਜ
    ${LinkCount}    Get Element Count    //div[@id='SIvCob']/a
    Log    ${LinkCount}
    ${text}    Get Element Attribute    //div[@class='FPdoLc tfB0Bf']/center/input[1]    value
    Log    ${text}
    Dictionary Should Contain Value    ${dict_lang}    ${text}
    : FOR    ${i}    IN RANGE    1    ${LinkCount+1}
    \    Log    ${i}
    \    Dictionary Should Contain Value    ${dict_lang}    ${text}
    \    Click Element    //div[@id='SIvCob']/a[${i}]
    \    Go To    https://www.google.com
