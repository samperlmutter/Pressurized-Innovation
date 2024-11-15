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
        expect(page).to have_content("Articles")
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
        expect(page).to have_content("Articles")
        # click_text = 
        # page.find(:xpath,"//*[text()='#{click_text}']").click
        find('#article-title').click
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        expect(page).to have_content("0")
        visit like_create_path(:article_id => 1)
        expect(page).to have_content("1")
    end 
end

feature "Blogger can view liked articles on their profile page" do
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
        expect(page).to have_content("Articles")
               find('#article-title').click
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        expect(page).to have_content("0")
        visit like_create_path(:article_id => 1)
        expect(page).to have_content("1")
    end 
        scenario "Blogger views liked articles on their profile page" do
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
        expect(page).to have_content("Articles")
        find('#article-title').click
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        expect(page).to have_content("0")
        visit like_create_path(:article_id => 1)
        expect(page).to have_content("1")
        # USER NOW NAVIGATES TO THEIR PROFILE PAGE
        visit user_path(1)
        expect(page).to have_content("Capybara Name")
        expect(page).to have_content("Liked articles")
        page.find(:xpath,"//*[text()='#{"Liked articles"}']").click
        expect(page).to have_content("Capybara Name's liked articles")
        expect(page).to have_content("New Capybara Article")
    end 
end

feature "Blogger can view articles on the article listing page" do
    scenario "Blogger successfully creates two new articles" do
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
        # USER CREATES AN ARTICLE
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Submit"
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        # USER CREATES ANOTHER ARTICLE
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "Another New Capybara Article"
        fill_in "Text", with: "This is another new Capybara article"
        click_button "Submit"
        expect(page).to have_content("Another New Capybara Article")
        expect(page).to have_content("This is another new Capybara article")
    end

        scenario "Blogger views articles on the article listing page" do
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
        # USER CREATES AN ARTICLE
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Submit"
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        # USER CREATES ANOTHER ARTICLE
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "Another New Capybara Article"
        fill_in "Text", with: "This is another new Capybara article"
        click_button "Submit"
        expect(page).to have_content("Another New Capybara Article")
        expect(page).to have_content("This is another new Capybara article")
        # USER NAVIGATES TO THE ARTICLE LISTING PAGE
        visit articles_url
        expect(page).to have_content("Articles")
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        expect(page).to have_content("Another New Capybara Article")
        expect(page).to have_content("This is another new Capybara article")
    end 
end

feature "Blogger can edit an article" do
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
    scenario "Blogger edits an article" do
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
        # USER CREATES A NEW ARTICLE
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Submit"
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        # USER THEN EDITS THE ARTICLE
        visit articles_url
        expect(page).to have_content("Articles")
        #page.find(:xpath,"//*[text()='#{"create"}']").click
        find("#edit-button").click
        print page.body
        expect(page).to have_content("Editing article")
        fill_in "Title", with: "Edited New Capybara Article"
        fill_in "Text", with: "This is an edited new Capybara article"
        click_button "Submit"
        expect(page).to have_content("Edited New Capybara Article")
        expect(page).to have_content("This is an edited new Capybara article")
        visit articles_url
        expect(page).to have_content("Edited New Capybara Article")
        expect(page).to have_content("This is an edited new Capybara article")
    end 
end

feature "Blogger can leave a comment on an article" do
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
    scenario "Blogger leaves a comment on an article" do
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
        # USER CREATES A NEW ARTICLE
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Submit"
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        # USER THEN EDITS THE ARTICLE
        visit articles_url
        expect(page).to have_content("Articles")
        visit article_path(1)
        expect(page).to have_content("Add a comment:")
        fill_in "Commenter", with: "Capybara Commenter"
        fill_in "Body", with: "This is example text for a comment"
        click_button "Create Comment"
        expect(page).to have_content("Comments")
        expect(page).to have_content("Capybara Commenter")
        expect(page).to have_content("This is example text for a comment")
    end 
end