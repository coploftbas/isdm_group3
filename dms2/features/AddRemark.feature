Feature: AddRemark

  In order to keep track of the status of the document, I want to add remark when uploading documents to the projects.

  Scenario: Add remark to a document

    #Given I am a user
    Given I am signed in
    And there is a project
    When I visit the projects page
    Then I should see a tab for the all documents
    When I click the link for the all documents
    Then I should see the list of my documents
    And I should see upload button
    When I click the upload button
    Then I should see the dropdownlist to select document status
    When I upload the document
    Then I should see the remark added to the document

