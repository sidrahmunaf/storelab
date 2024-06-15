Feature: Home Page Testing App

  @android @final
  Scenario: User is able to sign-up with correct details
    Given App should open successfully
    And I click demo store option
    And I click on available demo store
    And I click on account option
    And I click on Sign In button
    And I click on Sign Up button
    And I type Adam in field for First Name
    And I type Clark in field for Last Name
    And I type random in field for Email
    And I type adam1234 in field for Password
    And I type adam1234 in field for Confirm Password
    And I click on Sign Up button
    Then I should see User created, Please log in! success message


  @android @final
  Scenario: User should see email already taken message if already taken email is used
    Given App should open successfully
    And I click demo store option
    And I click on available demo store
    And I click on account option
    And I click on Sign In button
    And I click on Sign Up button
    And I type Adam in field for First Name
    And I type Clark in field for Last Name
    And I type adamclark@gmail.com in field for Email
    And I type adam1234 in field for Password
    And I type adam1234 in field for Confirm Password
    And I click on Sign Up button
    Then I should see Email has already been taken success message


  @android @final
  Scenario: User should see error messages for invalid inputs
    Given App should open successfully
    And I click demo store option
    And I click on available demo store
    And I click on account option
    And I click on Sign In button
    And I click on Sign Up button
    And I type a in field for First Name
    And I type C in field for Last Name
    And I type gmailwww in field for Email
    And I type 11 in field for Password
    And I type 22 in field for Confirm Password
    And I click on Sign Up button
    Then I should see Name is too short error message
    And I should see Please enter a valid email address error message
    And I should see The password needs to be at least 8 characters long error message


  @android @final
  Scenario: User should be able to fill shipping form with valid input
    Given App should open successfully
    And I click demo store option
    And I click on available demo store
    And I click on shop option
    And I type sofa in search bar
    And I click on search button on search field
    And I click on Armchair One product
    And I click on Add to cart button
    And I wait 5 seconds
    And I click on cart option
    And I wait 5 seconds
    And I click on Checkout button
    And I wait 5 seconds
    And I click on Add button
    And I type 123 street in field for Address
    And I type NY in field for City
    And I type United States in field for Country
    And I click on United States option in Country dropdown
    And I close the keyboard
    And I type 10001 in field for Post/Zip Code
    And I type adam in field for First Name
    And I type clark in field for Last Name
    And I type 773473 in field for Phone Number (optional)
    And I scroll towards Save button
    And I click on Save button
    Then I should see the following saved address on checkout page
      """
      123 street
      NY
      United States
      10001
      """


  @android @final
  Scenario: User should see error message for blank shipping form
    Given App should open successfully
    And I click demo store option
    And I click on available demo store
    And I click on shop option
    And I type sofa in search bar
    And I click on search button on search field
    And I click on Armchair One product
    And I click on Add to cart button
    And I wait 5 seconds
    And I click on cart option
    And I wait 5 seconds
    And I click on Checkout button
    And I wait 5 seconds
    And I click on Add button
    And I scroll towards Save button
    And I click on Save button
    Then I should see Please fill in the address error message


  @android @final
  Scenario: User should see error message for blank city field
    Given App should open successfully
    And I click demo store option
    And I click on available demo store
    And I click on shop option
    And I type sofa in search bar
    And I click on search button on search field
    And I click on Armchair One product
    And I click on Add to cart button
    And I wait 5 seconds
    And I click on cart option
    And I wait 5 seconds
    And I click on Checkout button
    And I wait 5 seconds
    And I click on Add button
    And I type 123 street in field for Address
    And I type United States in field for Country
    And I click on United States option in Country dropdown
    And I close the keyboard
    And I type 10001 in field for Post/Zip Code
    And I type adam in field for First Name
    And I type clark in field for Last Name
    And I scroll towards Save button
    And I click on Save button
    Then I should see Please fill in the city error message


  @android @final
  Scenario: User should see error message for blank zip code field
    Given App should open successfully
    And I click demo store option
    And I click on available demo store
    And I click on shop option
    And I type sofa in search bar
    And I click on search button on search field
    And I click on Armchair One product
    And I click on Add to cart button
    And I wait 5 seconds
    And I click on cart option
    And I wait 5 seconds
    And I click on Checkout button
    And I wait 5 seconds
    And I click on Add button
    And I type 123 street in field for Address
    And I type United States in field for Country
    And I click on United States option in Country dropdown
    And I close the keyboard
    And I type NY in field for City
    And I type adam in field for First Name
    And I type clark in field for Last Name
    And I scroll towards Save button
    And I click on Save button
    Then I should see Please fill in the post code error message


  @android @final
  Scenario: User should see error message for invalid zip code
    Given App should open successfully
    And I click demo store option
    And I click on available demo store
    And I click on shop option
    And I type sofa in search bar
    And I click on search button on search field
    And I click on Armchair One product
    And I click on Add to cart button
    And I wait 5 seconds
    And I click on cart option
    And I wait 5 seconds
    And I click on Checkout button
    And I wait 5 seconds
    And I click on Add button
    And I type 123 street in field for Address
    And I type United States in field for Country
    And I click on United States option in Country dropdown
    And I close the keyboard
    And I type NY in field for City
    And I type ABC in field for Post/Zip Code
    And I type adam in field for First Name
    And I type clark in field for Last Name
    And I scroll towards Save button
    And I click on Save button
    Then I should see Enter a valid ZIP code for United States error message


  @android @final
  Scenario: User should see error message for blank last name field
    Given App should open successfully
    And I click demo store option
    And I click on available demo store
    And I click on shop option
    And I type sofa in search bar
    And I click on search button on search field
    And I click on Armchair One product
    And I click on Add to cart button
    And I wait 5 seconds
    And I click on cart option
    And I wait 5 seconds
    And I click on Checkout button
    And I wait 5 seconds
    And I click on Add button
    And I type 123 street in field for Address
    And I type United States in field for Country
    And I click on United States option in Country dropdown
    And I close the keyboard
    And I type NY in field for City
    And I type 10001 in field for Post/Zip Code
    And I type adam in field for First Name
    And I scroll towards Save button
    And I click on Save button
    Then I should see signUp_lastNameField error message


  @android @final
  Scenario: User should be able to update shipping form
    Given App should open successfully
    And I click demo store option
    And I click on available demo store
    And I click on shop option
    And I type sofa in search bar
    And I click on search button on search field
    And I click on Armchair One product
    And I click on Add to cart button
    And I wait 5 seconds
    And I click on cart option
    And I wait 5 seconds
    And I click on Checkout button
    And I wait 5 seconds
    And I click on Add button
    And I type 123 street in field for Address
    And I type NY in field for City
    And I type United States in field for Country
    And I click on United States option in Country dropdown
    And I close the keyboard
    And I type 10001 in field for Post/Zip Code
    And I type adam in field for First Name
    And I type clark in field for Last Name
    And I type 773473 in field for Phone Number (optional)
    And I scroll towards Save button
    And I click on Save button
    Then I should see the following saved address on checkout page
      """
      123 street
      NY
      United States
      10001
      """
    And I click on Edit button
    And I type CA in field for City
    And I scroll towards Save button
    And I click on Save button
    Then I should see the following saved address on checkout page
      """
      123 street
      CA
      United States
      10001
      """


  @android @final
  Scenario: User should see error message if incorrect zip code is used for state
    Given App should open successfully
    And I click demo store option
    And I click on available demo store
    And I click on shop option
    And I type sofa in search bar
    And I click on search button on search field
    And I click on Armchair One product
    And I click on Add to cart button
    And I wait 5 seconds
    And I click on cart option
    And I wait 5 seconds
    And I click on Checkout button
    And I wait 5 seconds
    And I click on Add button
    And I type 123 street in field for Address
    And I type NY in field for City
    And I type United States in field for Country
    And I click on United States option in Country dropdown
    And I close the keyboard
    And I type Arizona in field for Province/State
    And I click on Arizona option in Province/State dropdown
    And I close the keyboard
    And I type 10001 in field for Post/Zip Code
    And I type adam in field for First Name
    And I type clark in field for Last Name
    And I type 773473 in field for Phone Number (optional)
    And I scroll towards Save button
    And I click on Save button
    Then I should see Enter a valid ZIP code for Arizona, United States error message
    When I click on Add button
    And I type 85082 in field for Post/Zip Code
    And I scroll towards Save button
    And I click on Save button
    Then I should see the following saved address on checkout page
      """
      123 street
      NY
      United States
      85082
      """

