
def login
    # visit '/'
    # click_link 'Register'
    # fill_in 'Email', with: 'a@a.com'
    # fill_in 'Password', with: '12345678'
    # fill_in 'Password confirmation', with: '12345678'
    # click_button 'Sign up'
    visit '/'
    user = FactoryGirl.create(:user)
    login_as(user)
end

def login_admin
    admin = FactoryGirl.create(:admin)
    login_as(admin)
end

def login_admin_new
    admin = FactoryGirl.create(:admintwo)
    login_as(admin)
end

def logout_admin
    click_link 'Logout Admin'
end

def logout_user
    click_link 'Logout'
end

def login_new
    visit '/'
    user_two = FactoryGirl.create(:usertwo)
    login_as_new(user_two)
end

def login_as_new(user)
    click_link 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
end