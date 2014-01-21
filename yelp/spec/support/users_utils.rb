
def login
    # visit '/'
    # click_link 'Register'
    # fill_in 'Email', with: 'a@a.com'
    # fill_in 'Password', with: '12345678'
    # fill_in 'Password confirmation', with: '12345678'
    # click_button 'Sign up'
    visit '/'
    user = User.create(email: 'a@a.com', password: '12345678', password_confirmation: '12345678')
    login_as(user)
end

def login_admin
    admin = Admin.create(email: 'a@basta.lt', password: '12345678', password_confirmation: '12345678')
    login_as(admin)
end

def login_new
    # visit '/'
    # click_link 'Register'
    # fill_in 'Email', with: 'a@a.com'
    # fill_in 'Password', with: '12345678'
    # fill_in 'Password confirmation', with: '12345678'
    # click_button 'Sign up'
    visit '/'
    user = User.create(email: 'ap@a.com', password: '12345678', password_confirmation: '12345678')
    login_as(user)
end
