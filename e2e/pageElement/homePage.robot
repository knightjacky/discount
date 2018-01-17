*** Settings ***
Library                         Selenium2Library
Resource      	                ../platformSetting/platformSetting.robot
Resource      	                ../pageElement/branchPage.robot
Resource      	                ../pageElement/mobileHomePage.robot

*** Variables ***
${Logo}                         css=[data-qa="logo"]
${languageDrop}                 css=[data-qa="langDrop"]
${englishLanguage}              css=[data-qa="english"]
${frenchLanguage}               css=[data-qa="french"]
${countryField}                 css=[data-qa="country-field"]
${addressField}                 css=[data-qa="address"]
${currentLocation}              css=[qa-data="use-current-location"] a
${search-branch}                css=[data-qa="search-branch-name"] a
${seeAllBranches}               css=#customAutocomplete [ng-click="showIdx \= 100"]
${popup-branch-input}           css=#searchByBranch #customAutocomplete input
${popup-branch-ok}              css=#searchByBranch #customAutocomplete button
${popup-all-branches}           css=#searchByBranch #customAutocomplete a[ui-sref="locations-home"]
${errorMessage}                 css=#searchByBranch #customAutocomplete .text-danger
${startDateField}               css=date-input[data-qa="pickup-date"] [data-qa="ctrl.name"]
${startTimeField}               css=time-input[data-qa="pickup-time"] [data-qa="time"]
${returnDateField}              css=date-input[data-qa="return-date"] [data-qa="ctrl.name"]
${returnTimeField}              css=time-input[data-qa="return-time"] [data-qa="time"]
${pickup1AM}                    css=[data-qa="pickup-time"] [data-qa="01\:00 am"]
${return1AM}                    css=[data-qa="return-time"] [data-qa="01\:00 am"]
${promoField}                   css=homepage-promo-code[label="PROMO CODE"] [data-qa="PROMO CODE"]
${findVehicleButton}            css=[data-qa="find-vehicle"] [data-qa="btn-act-green homepage-find-vehicle"] span
${calendarTitle}                css=div[ng-switch="datepickerMode"] strong
${calendarLeftButton}           css=div[ng-switch="datepickerMode"] .glyphicon-chevron-left
${calendarRightButton}          css=div[ng-switch="datepickerMode"] .glyphicon-chevron-right
${calendarMonthMay}             css=tbody [ng-repeat="row in rows track by \$index"]:nth-of-type(2) [ng-repeat="dt in row track by dt\.date"]:nth-of-type(2) [type]
${calendarDateFrist}            css=tbody [ng-repeat="row in rows track by \$index"]:nth-of-type(1) [ng-repeat="dt in row track by dt\.date"]:nth-of-type(4) [ng-class="\:\:\{\'text-muted\'\: dt\.secondary\, \'text-info\'\: dt\.current\}"]
${calendarDateThird}            css=tbody [ng-repeat="row in rows track by \$index"]:nth-of-type(1) [ng-repeat="dt in row track by dt\.date"]:nth-of-type(6) [ng-class="\:\:\{\'text-muted\'\: dt\.secondary\, \'text-info\'\: dt\.current\}"]
${custom-email}                 css=[qa-data="custom-input"] input
${reserve-number}               css=[qa-data="custom-input2"]   input
${modify-reserve-button}        css=[data-qa="btn-act-green w-100-m"]
${cancel-reserve-button}        css=[data-qa="btn-act-green mobile-btn-blue w-100-m"]
${tooltip}                      css=[data-qa="tooltip-details-link"] span
${tooltipmessage}               css=[data-qa="tooltip-details-link"] [tooltip-animation-class="fade"]
${dialacclink}                  css=#dialacclink a
${Terms-conditions-links}       css=[data-qa="Terms-conditions-links"] a
${tab-car}                      css=[data-qa="tab-car"] span
${tab-truck}                    css=[data-qa="tab-truck"] span
${tab-mng}                      css=[data-qa="tab-mng"] span
${18.95-rental}                 css=#reservation [data-qa="18.95-rental-link"]
${great-weekend-rates}          css=#reservation [data-qa="unlimited-detours-link"]
${earn-triple-points}           css=#reservation [data-qa="petro-slider-link"]
${signup-earn-points}           css=#webdiscount-home [data-qa="signup"]
${moving-Supplies}              css=[sref="BELOW-FOLD-ADS\.LEFT-SMALL-AD\.SREF"] a
${one-way-rentals}              css=[sref="BELOW-FOLD-ADS\.MIDDLE-SMALL-AD\.SREF"] a
${europ-car-rental}             css=[href="BELOW-FOLD-ADS\.RIGHT-SMALL-AD\.HREF"] a
${one-two-free-weekend}         css=[sref="BELOW-FOLD-ADS.LARGE-AD.SREF"] a
${see-all-pomotions}            css=[data-qa="see-all-button"]
${get-start-button}             css=#reservation [data-qa="get-start-button"]
${how-to-load}                  css=#reservation [data-qa="how-to-load-link"]
${offer-moving-supplies}        css=#reservation [data-qa="offer-moving-supplies-link"]
${twitter-icon}                 css=[data-qa="twitter-icon"]
${facebook-icon}                css=[data-qa="facebook-icon"]


*** Keywords ***
Change PickUp Date To 2019 May 1
    Run Keyword If      '${testPlatform}' == 'OS'                   Change PickUp Date To 2019 May 1 On Desktop
    Run Keyword If      '${testPlatform}' == 'Mobile'               Change PickUp Date To 2019 May 1 On Mobile

Change Return Date To 2019 May 3
    Run Keyword If      '${testPlatform}' == 'OS'                   Change Return Date To 2019 May 3 On Desktop
    Run Keyword If      '${testPlatform}' == 'Mobile'               Change Return Date To 2019 May 3 On Mobile

Change PickUp Time To 1 AM
    Run Keyword If      '${testPlatform}' == 'OS'                   Change PickUp Time To 1 AM On Desktop
    Run Keyword If      '${testPlatform}' == 'Mobile'               Change PickUp Time To 1 AM On Mobile

Change Return Time To 1 AM
    Run Keyword If      '${testPlatform}' == 'OS'                   Change Return Time To 1 AM On Desktop
    Run Keyword If      '${testPlatform}' == 'Mobile'               Change Return Time To 1 AM On Mobile

Switch The Language To
    [Arguments]     ${language}
    wait until element is visible   ${languageDrop}        timeout=30
    click element   ${languageDrop}
    wait until element is visible   ${englishLanguage}      timeout=30
    Run Keyword If      'english' == '${language}'      click element          ${englishLanguage}
    Run Keyword If      'french' == '${language}'       click element          ${frenchLanguage}
    wait until element is visible   ${logo}     timeout=30

Varify Swith Language And Country To
    [Arguments]      ${language}         ${country}
    Switch The Language To      ${language}
    ${windowTitle}=    get title
    wait until element is visible   ${countryField}        timeout=30
    click element   ${countryField}
    wait until element is visible   css=[data-qa="${country}"]      timeout=30
    click element   css=[data-qa="${country}"]
    sleep    1s
    select Window    Title=	Car Rentals & Truck Rentals | Discount Car and Truck Rentals Canada
    sleep    1s
    wait until element is visible   ${Logo}      timeout=30
    select window    Title=${windowTitle}
    wait until element is visible   ${Logo}      timeout=30

Fill Up Reserve The City Name In Reserve A Car Form
    [Arguments]     ${City}
    wait until element is visible   ${addressField}      timeout=30
    input Text    ${addressField}   ${city}
    wait until element is visible   ${seeAllBranches}       timeout=30

Select My Current Location To Fill Up Reserve A Car Form
    wait until element is visible   ${addressField}      timeout=30
    click element  ${addressField}
    wait until element is visible   ${currentLocation}       timeout=30
    double click element  ${currentLocation}
    sleep   5s

Select Search Branches From Reserve A Car Form
    [Arguments]     ${branch}
    Run Keyword If      '${testPlatform}' == 'OS'                   Search Branches On Desktop      ${branch}
    Run Keyword If      '${testPlatform}' == 'Mobile'               Search Branches On Mobile       ${branch}

Fill Up Promo Code In Reserve A car Form
    [Arguments]     ${code}
    Run Keyword If      '${testPlatform}' == 'OS'                   Input Promo Code On Desktop      ${code}
    Run Keyword If      '${testPlatform}' == 'Mobile'               Input Promo Code On Mobile       ${code}

Verify One Day Van Rentals Promotion
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify One Day Van Rentals On Desktop
    Run Keyword If      '${testPlatform}' == 'Mobile'               Verify One Day Van Rentals On Mobile

Verify Great Weekend Rates Promotion
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify Great Weekend Rates On Desktop
    Run Keyword If      '${testPlatform}' == 'Mobile'               Verify Great Weekend Rates On Mobile

Verify Earn Triple Points Promotion
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify Earn Triple Points On Desktop
    Run Keyword If      '${testPlatform}' == 'Mobile'               Verify Earn Triple Points On Mobile

Verify Sign Up To Getting Points Promotion
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify Sign Up Link

Verify Moving Supplies Promotion
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify Moving Supplies

Verify One Way Rentals Promotion
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify One Way Rentals

Verify Pratners With Europ Car Webpage
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify Pratners With Europ Car

Verify One Two Free Weekend Promotion
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify One Two Free Weekend

Verify Free Moving Concierge Webpage
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify Free Moving Concierge On Desktop
    Run Keyword If      '${testPlatform}' == 'Mobile'               Verify Free Moving Concierge On Mobile

Verify How To Load A Moving Truck Information
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify How To Load On Desktop
    Run Keyword If      '${testPlatform}' == 'Mobile'               Verify How To Load On Mobile

Verify Offer Moving Supplies promotion
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify Offer Moving Supplies On Desktop
    Run Keyword If      '${testPlatform}' == 'Mobile'               Verify Offer Moving Supplies On Mobile

Verify Follow On Twitter Webpage
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify Follow On Twitter

Verify Follow On Facebook Webpage
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify Follow On Facebook

Verify Return Vehicle To A Different Location Details ToolTip
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify Tooltip

Click On Find A Vehicle Button On Reseve A Car Form
    Run Keyword If      '${testPlatform}' == 'OS'                   Click On Find Vehicle On Desktop
    Run Keyword If      '${testPlatform}' == 'Mobile'               Click On Find Vehicle On Mobile

Verify 3 Tabs For Reserve Car And Reserve Truck And Modify Reservation
    Run Keyword If      '${testPlatform}' == 'OS'                   Verify 3 Tabs

Varify 3 Buttons For Find Branch And Manage Reservation And Contact Support
    Run Keyword If      '${testPlatform}' == 'Mobile'               Varify 3 Buttons On Mobile

Search Branches On Desktop
    [Arguments]     ${branch}
    wait until element is visible   ${logo}     timeout=30
    click element   ${logo}
    wait until element is visible   ${addressField}      timeout=30
    Change PickUp Date To 2019 May 1 On Desktop
    click element   ${addressField}
    wait until element is visible   ${search-branch}       timeout=30
    click element   ${search-branch}
    wait until element is visible   ${popup-branch-input}       timeout=30
    input text      ${popup-branch-input}       Molton
    wait until element is visible   ${errorMessage}     timeout=30
    Clear Element Text      ${popup-branch-input}
    Press Key    ${popup-branch-input}    \\8
    input text      ${popup-branch-input}       ${branch}
    Press Key    ${popup-branch-input}    \\13
    wait until element is visible       css=#searchByBranch #customAutocomplete ul li div        timeout=30
    click element   css=#searchByBranch #customAutocomplete ul li div
    wait until element is visible   ${popup-branch-ok}
    click element   ${popup-branch-ok}
    wait until element is visible   ${logo}     timeout=30

### DeskTop Keyword ###
Change PickUp Date To 2019 May 1 On Desktop
    wait until element is visible   ${startDateField}        timeout=30
    click element   ${startDateField}
    wait until element is visible   ${calendarTitle}        timeout=30
    click element   ${calendarTitle}
    wait until element is visible   ${calendarRightButton}        timeout=30
    click element   ${calendarRightButton}
    wait until element is visible   ${calendarMonthMay}        timeout=30
    click element   ${calendarMonthMay}
    wait until element is visible   ${calendarDateFrist}        timeout=30
    click element   ${calendarDateFrist}
    wait until element is visible   ${logo}     timeout=30

Change Return Date To 2019 May 3 On Desktop
    wait until element is visible   ${returnDateField}        timeout=30
    click element   ${returnDateField}
    wait until element is visible   ${calendarTitle}        timeout=30
    click element   ${calendarTitle}
    wait until element is visible   ${calendarRightButton}        timeout=30
    click element   ${calendarRightButton}
    wait until element is visible   ${calendarMonthMay}        timeout=30
    click element   ${calendarMonthMay}
    wait until element is visible   ${calendarDateThird}        timeout=30
    click element   ${calendarDateThird}
    wait until element is visible   ${logo}     timeout=30

Change PickUp Time To 1 AM On Desktop
    wait until element is visible   ${startTimeField}       timeout=30
    click element   ${startTimeField}
    wait until element is visible   ${pickup1AM}      timeout=30
    click element   ${pickup1AM}

Change Return Time To 1 AM On Desktop
    wait until element is visible   ${returnTimeField}       timeout=30
    click element   ${returnTimeField}
    wait until element is visible   ${return1AM}      timeout=30
    click element   ${return1AM}

Input Promo Code On Desktop
    [Arguments]     ${code}
    wait until element is visible   ${promoField}
    input text      ${promoField}       ${code}

Verify One Day Van Rentals On Desktop
    wait until element is visible   ${18.95-rental}        timeout=30
    click element   ${18.95-rental}
    wait until element is visible   css=#promoTemplate    timeout=30
    screenshot      OneDayVanRentalsPage
    click element   ${logo}

Verify Great Weekend Rates On Desktop
    wait until element is visible   ${great-weekend-rates}        timeout=30
    click element   ${great-weekend-rates}
    wait until element is visible   css=#promoTemplate    timeout=30
    screenshot      GreatWeekendRatesPage
    click element   ${logo}

Verify Earn Triple Points On Desktop
    wait until element is visible   ${earn-triple-points}        timeout=30
    click element   ${earn-triple-points}
    wait until element is visible   css=#promoTemplate    timeout=30
    screenshot      EarnTriplePointsPage
    click element   ${logo}

Verify Sign Up Link
    wait until element is visible   ${signup-earn-points}        timeout=30
    click element   ${signup-earn-points}
    wait until element is visible   css=#promoTemplate    timeout=30
    screenshot      SignUpEarnPointsPage
    click element   ${logo}

Verify Moving Supplies
    wait until element is visible   ${moving-Supplies}        timeout=30
    click element   ${moving-Supplies}
    wait until element is visible   css=#promoTemplate    timeout=30
    screenshot      MovingSuppliesPage
    click element   ${logo}

Verify One Way Rentals
    wait until element is visible   ${one-way-rentals}        timeout=30
    click element   ${one-way-rentals}
    wait until element is visible   css=#promoTemplate    timeout=30
    screenshot      OnewayRentalsPage
    click element   ${logo}

Verify Pratners With Europ Car
    click element   ${logo}
    wait until element is visible   ${europ-car-rental}        timeout=30
    click element   ${europ-car-rental}
    ${windowTitle}=    get title
    sleep       1s
    select window   url=https://rent.discountcar.com/EuropCar/ReservationStep1?langid=1
    wait until element is visible   css=#reservation    timeout=30
    close window
    select window   Title=${windowTitle}
    wait until element is visible   ${logo}        timeout=30

Verify One Two Free Weekend
    wait until element is visible   ${one-two-free-weekend}        timeout=30
    click element   ${one-two-free-weekend}
    wait until element is visible   css=#promoTemplate    timeout=30
    screenshot      OneTwoFreeWeekendPage
    click element   ${logo}
    wait until element is visible   ${see-all-pomotions}        timeout=30
    click element   ${see-all-pomotions}
    wait until element is visible   css=#morePromos    timeout=30
    screenshot      SeeAllPomotionsPage
    click element   ${logo}

Verify Free Moving Concierge On Desktop
    click element   ${logo}
    wait until element is visible   ${get-start-button}        timeout=30
    click element   ${get-start-button}
    ${windowTitle}=    get title
    sleep       1s
    select window   url=https://movesnap.com/discounttruck
    wait until element is visible   css=#mv    timeout=30
    close window
    select window   Title=${windowTitle}
    wait until element is visible   ${logo}        timeout=30

Verify How To Load On Desktop
    wait until element is visible   ${how-to-load}        timeout=30
    click element   ${how-to-load}
    wait until element is visible   css=#post-head    timeout=30
    screenshot      HowToLoadPage
    click element   ${logo}

Verify Offer Moving Supplies On Desktop
    wait until element is visible   ${offer-moving-supplies}        timeout=30
    click element   ${offer-moving-supplies}
    wait until element is visible   css=#promoTemplate    timeout=30
    screenshot      OfferMovingSuppliesPage
    click element   ${logo}

Verify Tooltip
    click element   ${logo}
    wait until element is visible   ${tooltip}
    click element   ${tooltip}
#    wait until element is visible   ${tooltipmessage}       timeout=30

Click On Find Vehicle On Desktop
    wait until element is visible   ${findVehicleButton}    timeout=30
    Click Element       ${findVehicleButton}
    Wait Until Element Is Visible    ${logo}   timeout=30

Verify 3 Tabs
    wait until element is visible   ${tab-truck}    timeout=30
    click element       ${tab-truck}
    wait until element is visible     ${countryField}    timeout=30
    element should be visible     ${addressField}
    element should be visible     ${startDateField}
    element should be visible     ${startTimeField}
    element should be visible     ${returnDateField}
    element should be visible     ${returnTimeField}
    element should be visible     ${promoField}
    element should be visible     ${findVehicleButton}
    element should be visible     ${tooltip}
    element should be visible     ${dialacclink}
    element should be visible     ${terms-conditions-links}
    wait until element is visible     ${tab-mng}    timeout=30
    click element       ${tab-mng}
    wait until element is visible     ${custom-email}    timeout=30
    element should be visible     ${reserve-number}
    element should be visible     ${modify-reserve-button}
    element should be visible     ${cancel-reserve-button}
    element should be visible     ${terms-conditions-links}
    wait until element is visible     ${tab-car}    timeout=30
    click element       ${tab-car}
    wait until element is visible     ${countryField}    timeout=30
    element should be visible     ${addressField}
    element should be visible     ${startDateField}
    element should be visible     ${startTimeField}
    element should be visible     ${returnDateField}
    element should be visible     ${returnTimeField}
    element should be visible     ${promoField}
    element should be visible     ${findVehicleButton}
    element should be visible     ${tooltip}
    element should be visible     ${dialacclink}
    element should be visible     ${terms-conditions-links}

Verify Follow On Twitter
    click element   ${logo}
    wait until element is visible   ${twitter-icon}        timeout=30
    click element   ${twitter-icon}
    ${windowTitle}=    get title
    sleep       1s
    select window   url=https://twitter.com/discountcar
    wait until element is visible   css=.Icon--bird    timeout=30
    close window
    select window   Title=${windowTitle}
    wait until element is visible   ${logo}        timeout=30

Verify Follow On Facebook
    click element   ${logo}
    wait until element is visible   ${facebook-icon}        timeout=30
    click element   ${facebook-icon}
    ${windowTitle}=    get title
    sleep       1s
    select window   url=https://www.facebook.com/DiscountCarAndTruckRentals
    wait until element is visible   css=.fb_logo    timeout=30
    close window
    select window   Title=${windowTitle}
    wait until element is visible   ${logo}        timeout=30




### Mobile Keyword ###
Change PickUp Date To 2019 May 1 On Mobile
    Click On Find Vehicle On Mobile
    wait until element is visible   ${MstartDateField}        timeout=30
    click element   ${MstartDateField}
    wait until element is visible   ${McalendarTitle}        timeout=30
    click element   ${McalendarTitle}
    wait until element is visible   ${McalendarRightButton}        timeout=30
    click element   ${McalendarRightButton}
    wait until element is visible   ${McalendarMonthMay}        timeout=30
    click element   ${McalendarMonthMay}
    wait until element is visible   ${McalendarDateFrist}        timeout=30
    click element   ${McalendarDateFrist}
    wait until element is visible   ${Mlogo}     timeout=30

Change Return Date To 2019 May 3 On Mobile
    wait until element is visible   ${MreturnDateField}        timeout=30
    click element   ${MreturnDateField}
    wait until element is visible   ${McalendarTitle}        timeout=30
    click element   ${McalendarTitle}
    wait until element is visible   ${McalendarRightButton}        timeout=30
    click element   ${McalendarRightButton}
    wait until element is visible   ${McalendarMonthMay}        timeout=30
    click element   ${McalendarMonthMay}
    wait until element is visible   ${McalendarDateThird}        timeout=30
    click element   ${McalendarDateThird}
    wait until element is visible   ${Mlogo}     timeout=30

Change PickUp Time To 1 AM On Mobile
    wait until element is visible   ${MstartTimeField}       timeout=30
    click element   ${MstartTimeField}
    wait until element is visible   ${Mpickup1AM}      timeout=30
    click element   ${Mpickup1AM}

Change Return Time To 1 AM On Mobile
    wait until element is visible   ${MreturnTimeField}       timeout=30
    click element   ${MreturnTimeField}
    wait until element is visible   ${Mreturn1AM}      timeout=30
    click element   ${Mreturn1AM}

Search Branches On Mobile
    [Arguments]     ${branch}
    go to       url=${url}
#    wait until element is visible   ${Mlogo}     timeout=30
#    click element   ${Mlogo}
#    wait until element is visible   ${Mcancel-yes}      timeout=30
#    click element   ${Mcancel-yes}
#    wait until element is visible   ${Mlogo}     timeout=30
    Change PickUp Date To 2019 May 1 On Mobile
    wait until element is visible   ${MaddressField}      timeout=30
    click element   ${MaddressField}
    wait until element is visible   ${search-branch}       timeout=30
    click element   ${search-branch}
    wait until element is visible   ${popup-branch-input}       timeout=30
    input text      ${popup-branch-input}       Molton
    wait until element is visible   ${errorMessage}     timeout=30
    Clear Element Text      ${popup-branch-input}
    Press Key    ${popup-branch-input}    \\8
    input text      ${popup-branch-input}       ${branch}
    Press Key    ${popup-branch-input}    \\13
    wait until element is visible       css=#searchByBranch #customAutocomplete ul li div        timeout=30
    click element   css=#searchByBranch #customAutocomplete ul li div
    wait until element is visible   ${popup-branch-ok}
    click element   ${popup-branch-ok}
    wait until element is visible   ${Mlogo}     timeout=30

Input Promo Code On Mobile
    [Arguments]     ${code}
    wait until element is visible   ${promoField}
    input text      ${promoField}       ${code}

Click On Find Vehicle On Mobile
    wait until element is visible   ${MfindVehicleButton}    timeout=30
    Click Element       ${MfindVehicleButton}
    Wait Until Element Is Visible    ${Mlogo}   timeout=30

Verify One Day Van Rentals On Mobile
    wait until element is visible   ${M18.95-rental}        timeout=30
    click element   ${M18.95-rental}
    wait until element is visible   css=#promoTemplate    timeout=30
    screenshot      OneDayVanRentalsPage
    click element   ${Mlogo}

Verify Great Weekend Rates On Mobile
    wait until element is visible   ${Mgreat-weekend-rates}        timeout=30
    click element   ${Mgreat-weekend-rates}
    wait until element is visible   css=#promoTemplate    timeout=30
    screenshot      GreatWeekendRatesPage
    click element   ${Mlogo}

Verify Earn Triple Points On Mobile
    wait until element is visible   ${Mearn-triple-points}        timeout=30
    click element   ${Mearn-triple-points}
    wait until element is visible   css=#promoTemplate    timeout=30
    screenshot      EarnTriplePointsPage
    click element   ${Mlogo}

Verify Free Moving Concierge On Mobile
    click element   ${Mlogo}
    wait until element is visible   ${Mget-start-button}        timeout=30
    click element   ${Mget-start-button}
    ${windowTitle}=    get title
    sleep       1s
#    select window   url=https://movesnap.com/discounttruck
#    wait until element is visible   css=#mv    timeout=30
#    close window
    select window   Title=${windowTitle}
    wait until element is visible   ${Mlogo}        timeout=30

Verify How To Load On Mobile
    wait until element is visible   ${Mhow-to-load}        timeout=30
    click element   ${Mhow-to-load}
    wait until element is visible   css=#post-head    timeout=30
    screenshot      HowToLoadPage
    click element   ${Mlogo}

Verify Offer Moving Supplies On Mobile
    wait until element is visible   ${Moffer-moving-supplies}        timeout=30
    click element   ${Moffer-moving-supplies}
    wait until element is visible   css=#promoTemplate    timeout=30
    screenshot      OfferMovingSuppliesPage
    click element   ${Mlogo}

Varify 3 Buttons On Mobile
    wait until element is visible   ${MfindBranch}      timeout=30
    click element   ${MfindBranch}
    wait until element is visible   ${MLogo}        timeout=30
    select window   url=https://test.discountcar.com/locations-home
    click element   ${MLogo}
    wait until element is visible   ${MLogo}        timeout=30
    click element   ${MmanageReservation}
    wait until element is visible   ${MLogo}        timeout=30
    select window   url=https://test.discountcar.com/modify-res
    click element   ${MLogo}
    wait until element is visible   ${MLogo}        timeout=30
    click element   ${McontactSupport}
    wait until element is visible   ${MLogo}        timeout=30
    select window   url=https://test.discountcar.com/contact
    click element   ${MLogo}
    wait until element is visible   ${MLogo}        timeout=30