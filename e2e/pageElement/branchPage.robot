*** Settings ***
Library                         Selenium2Library
Resource      	                ../platformSetting/platformSetting.robot

*** Variables ***
${firstBranchLocation}          css=img[src="assets\/img\/logo_img\.png"]

*** Keywords ***
keyword should exist