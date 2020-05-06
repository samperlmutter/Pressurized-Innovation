require 'rails_helper.rb'

feature "Blogger creates a new user account and signs into it" do
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

feature "Blogger creates a new Article" do
    scenario "Blogger signs into their account" do
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
        # USER IS NOW SIGNED IN
    end
    scenario "Blogger successfully navigates to the new articles page from the listing articles page" do
        visit articles_path
        expect(page).to have_content("Article Listing")
        click_link "New article"
        expect(page).to have_content("New Article")
        expect(page).to have_field("Title")
        expect(page).to have_field("Text")
    end
    scenario "Blogger successfully creates a new article" do
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
        # USER IS NOW SIGNED IN
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Submit"
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
    end
end

feature "Blogger has the ability to like an article" do
    scenario "Blogger successfully creates a new article" do
        # USER ACCOUNT CREATED AND SIGNED IN
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
        # USER IS NOW SIGNED IN
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Submit"
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
    end
    scenario "Blogger likes an article" do
        # USER ACCOUNT CREATED AND SIGNED IN
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
        # USER IS NOW SIGNED IN
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Submit"
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        # USER NAVIGATES TO THE ARTICLE LISTING PAGE
        visit articles_url
        expect(page).to have_content("Article Listing")
        click_text = "Show"
        page.find(:xpath,"//*[text()='#{click_text}']").click
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        expect(page).to have_content("Likes: 0")
        click_text = "Like article"
        page.find(:xpath,"//*[text()='#{click_text}']").click
        expect(page).to have_content("Likes: 1")
    end 
end
