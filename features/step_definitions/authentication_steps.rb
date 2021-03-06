Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^they submit invalid signin information$/ do
  click_button "Sign in"
end

Then /^they should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-error')
end	

And /^the user has an account$/ do
  @user = User.create(name: "dan", email: "dan@bk.ru", 
        password: "123456", password_confirmation: "123456")
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email.upcase
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then /^they should see their profile page$/ do
  expect(page).to have_title(@user.name)
end

And /^they should see a signout link$/ do
  expect(page).to have_link('Sign out', href: signout_path)
end