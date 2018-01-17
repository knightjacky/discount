*** Settings ***
Documentation               This suite test for end to end
Resource                    ../platformSetting/platformSetting.robot
Resource                    ../pageElement/homePage.robot
Resource                    ../pageElement/branchPage.robot
Suite Setup                 Run Keywords
...                         Open Browser To Home Page With    AND
...                         Open Screenshot Session
Test Setup                  Go To     ${URL}
Suite Teardown              Run Keywords
...                         Close Screenshot Session    AND
...                         Close All Browsers

*** Test Cases ***

Test For Home Page
    Verify One Day Van Rentals Promotion                                             # LTS-11
    Verify Great Weekend Rates Promotion                                             # LTS-11
    Verify Earn Triple Points Promotion                                              # LTS-11
    Verify Sign Up To Getting Points Promotion                                       # only desktop has it LTS-10
    Verify Moving Supplies Promotion                                                 # only desktop has it LTS-9
    Verify One Way Rentals Promotion                                                 # only desktop has it LTS-9
    Verify Pratners With Europ Car Webpage                                           # only desktop has it LTS-9
    Verify One Two Free Weekend Promotion                                            # only desktop has it LTS-9
    Verify Free Moving Concierge Webpage                                             # LTS-15
    Verify How To Load A Moving Truck Information                                    # LTS-15
    Verify Offer Moving Supplies promotion                                           # LTS-15
    Verify Follow On Twitter Webpage                                                 # only desktop has it    LTS-29
    Verify Follow On Facebook Webpage                                                # only desktop has it    LTS-29
    Verify Return Vehicle To A Different Location Details ToolTip                    # only desktop has it    LTS-45
    Verify 3 Tabs For Reserve Car And Reserve Truck And Modify Reservation           # only desktop has it    LTS-35 LTS-46 LTS-44 LTS-33 LTS-18 LTS-36
    Varify 3 Buttons For Find Branch And Manage Reservation And Contact Support      # only Mobile has them   LTS-50
    Change PickUp Date To 2019 May 1                                                 # LTS-13
    Change Return Date To 2019 May 3                                                 # LTS-14
    Change PickUp Time To 1 AM                                                       # LTS-16
    Change Return Time To 1 AM                                                       # LTS-17
    Fill Up Reserve The City Name In Reserve A Car Form       Toronto                # LTS-31
#    Select My Current Location To Fill Up Reserve A Car Form                         # LTS-32
    Click On Find A Vehicle Button On Reseve A Car Form                              # LTS-20
    Select Search Branches From Reserve A Car Form      Milton                       # LTS-43
    Fill Up Promo Code In Reserve A car Form        glfix                            # LTS-18
    screenshot      HomePage                                                         # LTS-19
    Click On Find A Vehicle Button On Reseve A Car Form                              # LTS-20
    sleep   5s

