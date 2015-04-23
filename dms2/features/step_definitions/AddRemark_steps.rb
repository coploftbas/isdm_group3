email = 'pipat@csim.com'
password = 'a123456789'
project_id = 1


=begin
Given(/^I am a user$/) do
  @user=User.new(email:email, password:password, user_type_id_id:my_user_type_id_id)
  @user.save!
end
=end

Given(/^I am signed in$/) do

  visit root_path
  expect(page).to have_content "Sign in"
  click_link 'Sign in'
  expect(current_path).to eq new_user_session_path

  visit '/users/sign_in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password

  click_button 'Log in'
end

Given(/^there is a project$/) do
  visit projects_path
end

When(/^I visit the projects page$/) do
  visit projects_path
  expect(page).to have_content "Project name"
  visit project_path(project_id)
end

Then(/^I should see a tab for the all documents$/) do
  visit project_path(project_id)
  expect(page).to have_content "All documents"
end

When(/^I click the link for the all documents$/) do
  click_link 'All documents'
end

Then(/^I should see the list of my documents$/) do
  expect(page).to have_content "Document list"
end

Then(/^I should see upload button$/) do
  expect(page).to have_link "Upload"
end

When(/^I click the upload button$/) do

end
Then(/^I should see the dropdownlist to select document status$/) do

end

When(/^I upload the document$/) do

end

Then(/^I should see the remark added to the document$/) do

end