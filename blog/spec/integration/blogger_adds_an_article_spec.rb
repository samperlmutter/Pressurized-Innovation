require 'rails_helper.rb'

feature"Blogger creates a new user account and signs into it" do
    scenario "Blogger sucessfully creates a new user account" do
        visit signup_path
        expect(page).to have_content("New User")
        fill_in "Name", with: "Capybara Name"
        fill_in "Email", with: "CapybaraEmail@gmail.com"
        fill_in "Bio", with: "Capybara bio"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Create User"
        expect(page).to have_content("Capybara Name")
    end
    scenario "Blogger logs into their newly created user account" do
        visit signup_path
        expect(page).to have_content("New User")
        fill_in "Name", with: "Capybara Name"
        fill_in "Email", with: "CapybaraEmail@gmail.com"
        fill_in "Bio", with: "Capybara bio"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Create User"
        expect(page).to have_content("Capybara Name")
        visit login_path
        expect(page).to have_content("Login")
        fill_in "Email", with: "capybaraemail@gmail.com"
        fill_in "Password", with: "123456"
        click_button "Login"
        expect(page).to have_content("Featured Article")  
    end

end
